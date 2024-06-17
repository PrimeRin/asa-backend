# frozen_string_literal: true

require_relative 'boot'

require 'rails/all'

Bundler.require(*Rails.groups)

module AsaBackend
  class Application < Rails::Application
    config.load_defaults 7.0
    config.api_only = true
    config.session_store :cookie_store, key: '_interslice_session'
    config.middleware.use ActionDispatch::Cookies
    config.middleware.use config.session_store, config.session_options
    config.autoload_paths += %W[#{config.root}/app/queries]
  end
end
