require "administrate/base_dashboard"

class PaymentDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    id: Field::Number,
    first_name: Field::Text.with_options(searchable: true),
    middle_name: Field::Text.with_options(searchable: true),
    last_name: Field::Text.with_options(searchable: true),
    paid_on: Field::DateTime.with_options(format: "%m/%d/%Y"),
    expire_on: Field::DateTime.with_options(format: "%m/%d/%Y"),
    amount: Field::String.with_options(searchable: false),
    comments: Field::Text.with_options(searchable: true),
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
    :paid_on,
    :amount,
    :comments,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :id,
    :first_name,
    :middle_name,
    :last_name,
    :paid_on,
    :expire_on,
    :amount,
    :comments,
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
    :paid_on,
    :expire_on,
    :amount,
    :comments,
  ].freeze

  # Overwrite this method to customize how payments are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(payment)
  #   "Payment ##{payment.id}"
  # end
end
