# config/initializers/session_store.rb
Rails.application.config.session_store :cookie_store, 
  key: '_docuseal_session',
  same_site: :none,
  secure: true,
  httponly: false,
  domain: :all
