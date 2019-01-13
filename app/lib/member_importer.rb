require "csv"

class MemberImporter
  def self.snake_case_names(h)
    p h.transform_keys(&:underscore)
  end
end
