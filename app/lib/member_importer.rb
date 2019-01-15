require "csv"

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

end
