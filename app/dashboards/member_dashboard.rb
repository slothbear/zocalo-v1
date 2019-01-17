require "administrate/base_dashboard"

class MemberDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    id: Field::Number,
    first_name: Field::Text.with_options(searchable: true),
    middle_name: Field::Text,
    last_name: Field::Text.with_options(searchable: true),
    address: Field::Text.with_options(searchable: true),
    city: Field::Text.with_options(searchable: true),
    state: Field::Text.with_options(searchable: true),
    zip: Field::Text.with_options(searchable: true),
    email: Field::Text.with_options(searchable: true),
    email_alternate: Field::Text.with_options(searchable: true),
    url: Field::Text.with_options(searchable: true),
    phone: Field::Text.with_options(searchable: true),
    phone_alternate: Field::Text.with_options(searchable: true),
    birthday: Field::DateTime.with_options(format: "%e-%B"),
    joined_on: Field::DateTime,
    renewed_on: Field::DateTime,
    expire_on: Field::DateTime.with_options(format: "%m/%d/%Y"),
    directory_items: Field::Text.with_options(searchable: true),
    interests: Field::Text.with_options(searchable: true),
    source: Field::Text.with_options(searchable: true),
    subscription_started_on: Field::DateTime,
    subscription_renewed_on: Field::DateTime,
    subscription_end_on: Field::DateTime,
    newsletter_format: Field::Text.with_options(searchable: true),
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :first_name,
    :last_name,
    :email,
    :expire_on,
    :interests,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :id,
    :first_name,
    :middle_name,
    :last_name,
    :address,
    :city,
    :state,
    :zip,
    :email,
    :email_alternate,
    :url,
    :phone,
    :phone_alternate,
    :birthday,
    :joined_on,
    :renewed_on,
    :expire_on,
    :directory_items,
    :interests,
    :source,
    :subscription_started_on,
    :subscription_renewed_on,
    :subscription_end_on,
    :newsletter_format,
    :created_at,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :first_name,
    :middle_name,
    :last_name,
    :address,
    :city,
    :state,
    :zip,
    :email,
    :email_alternate,
    :url,
    :phone,
    :phone_alternate,
    :birthday,
    :joined_on,
    :renewed_on,
    :expire_on,
    :directory_items,
    :interests,
    :source,
    :subscription_started_on,
    :subscription_renewed_on,
    :subscription_end_on,
    :newsletter_format,
  ].freeze

  # Overwrite this method to customize how members are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(member)
  #   "Member ##{member.id}"
  # end
end
