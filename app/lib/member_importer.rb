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
    year = birth_items["Birthyear"].to_i
    year = DEFAULT_BIRTH_YEAR if year.zero?

    month = birth_items["Birthmonth"].to_i
    day = birth_items["Birthday"].to_i
    Date.new(year.to_i, month.to_i, day.to_i)
  end

  def self.newsletter_preferences(old_prefs)
    no_email_newletter = old_prefs["NoElecNL"]
    no_attachment = old_prefs["NoAttach"]
    if no_email_newletter == "1"
      ""
    elsif no_attachment == "1"
      "link-only"
    else
      "attachment"
    end
  end

end
