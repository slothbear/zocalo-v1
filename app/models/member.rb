class Member < ApplicationRecord
  validates :last_name, presence: true
  scope :active, -> { Member.where(
    'expire_on > ?', 2.months.ago.at_beginning_of_month) }

  ALL_DIRECTORY_ITEMS = %w[
    first_name
    middle_name
    last_name
    address
    city
    state
    zip
    phone
    phone_alternate
    email
    email_alternate
    birthday
    url
    interests
  ]

end
