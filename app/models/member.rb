class Member < ApplicationRecord
  validates :last_name, presence: true

  def self.import(thing)
  end
end
