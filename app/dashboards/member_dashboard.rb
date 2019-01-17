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
    first_name: Field::Text,
    middle_name: Field::Text,
    last_name: Field::Text,
    address: Field::Text,
    city: Field::Text,
    state: Field::Text,
    zip: Field::Text,
    email: Field::Text,
    email_alternate: Field::Text,
    url: Field::Text,
    phone: Field::Text,
    phone_alternate: Field::Text,
    birthday: Field::DateTime,
    joined_on: Field::DateTime,
    renewed_on: Field::DateTime,
    expire_on: Field::DateTime,
    directory_items: Field::Text,
    interests: Field::Text,
    source: Field::Text,
    subscription_started_on: Field::DateTime,
    subscription_renewed_on: Field::DateTime,
    subscription_end_on: Field::DateTime,
    newsletter_format: Field::Text,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :id,
    :first_name,
    :middle_name,
    :last_name,
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
