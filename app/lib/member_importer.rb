require "csv"

DEFAULT_BIRTH_YEAR = 1908

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
    Date.new(year.to_i, month.to_i, day.to_i)
  end

  def self.newsletter_preferences(old_prefs)
    no_email_newletter = old_prefs["no_elec_nl"]
    no_attachment = old_prefs["no_attach"]
    if no_email_newletter == "1"
      ""
    elsif no_attachment == "1"
      "link-only"
    elsif no_attachment == "0"
      "attachment"
    else
      "undetermined-newsletter-template"
    end
  end

  def self.directory_items(items)
    return Array.new if items["directory"] == "0"
    exclusions = items["exclude"].split(",")
    Member::ALL_DIRECTORY_ITEMS - exclusions
  end

  def self.instantiate_dates(items)
    result = items.dup
    if joindate = items["joindate"]
      joined = Date.strptime(joindate, '%m/%d/%Y')
      result["created_at"] = joined
      result["joined_on"] = joined
    end
    if last_update = items["last_info_update"]
      updated = Date.strptime(last_update, '%m/%d/%Y')
      result["updated_at"] = updated
    end
    result
  end

  def self.remove_fields(fields, removals)
    fields.except(*removals)
  end

end
