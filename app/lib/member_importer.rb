require "csv"

DEFAULT_BIRTH_YEAR = 1908

TRANSMUTE_KEYS = {
  "lastname" => "last_name",
  "email1" => "email",
  "email2" => "email_alternate",
  "phone1" => "phone",
  "phone2" => "phone_alternate",
  "joindate" => "joined_on",
  "renewdate" => "renewed_on",
  "exp_date" => "expire_on",
  "sub_start" => "subscription_started_on",
  "sub_renew" => "subscription_renewed_on",
  "sub_end" => "subscription_end_on",
}

FIELDS_TO_REMOVE = [
  "id",
  "birthmonth",
  "birthyear",
  "directory",
  "exclude",
  "directory_update",
  "no_elec_nl",
  "email_list",
  "no_attach",
  "last_info_update",
]

class MemberImporter
  def self.snake_case_names(h)
    h.transform_keys(&:underscore)
  end

  def self.standardize_names(columns, transforms)
    columns.each_with_object(Hash.new) do |column, result|
      old_name, old_value = column
      new_name = transforms[old_name] || old_name
      result[new_name] = old_value
    end
  end

  def self.combine_birthday(birth_items)
    year = birth_items["birthyear"].to_i
    year = DEFAULT_BIRTH_YEAR if year.zero?

    month = birth_items["birthmonth"].to_i
    day = birth_items["birthday"].to_i
    return nil if month.zero? || day.zero?
    Date.new(year, month, day)
  end

  def self.newsletter_preferences(old_prefs)
    no_email_newletter = old_prefs["no_elec_nl"]
    no_attachment = old_prefs["no_attach"]
    if no_email_newletter == "1"
      ""
    elsif no_attachment == "1"
      "newsletter-link-only"
    elsif no_attachment == "0"
      "newsletter-attachment"
    else
      "undetermined-newsletter-template"
    end
  end

  def self.add_directory_exclusions(items)
    interests = items["interests"]
    return interests if items["directory"] == "0"
    exclusions = items["exclude"]
    return interests if exclusions.nil? || exclusions.start_with?("n/a")
    "EXCLUDE(" + exclusions + ") " + interests
  end

  def self.american_date(date)
    return nil if date.blank?
    Date.strptime(date, '%m/%d/%Y')
  end

  def self.instantiate_dates(items)
    result = items.dup
    if joindate = items["joined_on"]
      joined = american_date(joindate)
      result["created_at"] = joined
      result["joined_on"] = joined
    end

    result["updated_at"] = american_date(items["last_info_update"])
    result["renewed_on"] = american_date(items["renewed_on"])
    result["expire_on"] = american_date(items["expire_on"])
    result["subscription_started_on"] = american_date(items["subscription_started_on"])
    result["subscription_renewed_on"] = american_date(items["subscription_renewed_on"])
    result["subscription_end_on"] = american_date(items["subscription_end_on"])

    result
  end

  def self.remove_fields(fields, removals)
    fields.except(*removals)
  end

  def self.transmute(fields)
    snaked_fields = snake_case_names(fields)
    std_fields = standardize_names(snaked_fields, TRANSMUTE_KEYS)
    std_fields["birthday"] = combine_birthday(std_fields)
    std_fields["newsletter_format"] = newsletter_preferences(std_fields)
    std_fields["interests"] = add_directory_exclusions(std_fields)
    with_dates = instantiate_dates(std_fields)
    remove_fields(with_dates, FIELDS_TO_REMOVE)
  end

  def self.import_legacy_csv(file)
    convert_nil = ->(s) {s || ""}
    CSV.foreach(file, headers: true, converters: convert_nil) do |row|
      Member.create!(transmute(row.to_hash))
    end
  end

end
