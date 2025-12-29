# frozen_string_literal: true

# Disable CSRF protection for iframe requests
Rails.application.config.action_controller.forgery_protection_origin_check = false
Rails.application.config.action_dispatch.cookies_same_site_protection = :none
Rails.application.config.action_controller.default_protect_from_forgery = false

# CORS configuration
Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins '*'
    resource '*',
             headers: :any,
             methods: %i[get post put patch delete options head],
             credentials: true,
             expose: ['Set-Cookie']
  end
end
