require "csv"

class MemberImporter
  def self.standardize_column_names(h)
    p h.transform_keys(&:underscore)
  end
end
