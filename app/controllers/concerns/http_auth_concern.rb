module HttpAuthConcern
  extend ActiveSupport::Concern
  included do
      before_action :http_authenticate
  end

  def http_authenticate
      return true unless Rails.env == 'production'
      http_basic_authenticate_with(
        name: ENV.fetch("ADMIN_NAME"),
        password: ENV.fetch("ADMIN_PASSWORD"),
        realm: "Zocalo",
      )
  end

end
