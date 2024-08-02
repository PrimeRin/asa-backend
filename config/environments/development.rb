# frozen_string_literal: true

require 'active_support/core_ext/integer/time'

Rails.application.configure do
  config.cache_classes = false
  config.eager_load = false
  config.consider_all_requests_local = true
  config.server_timing = true
  if Rails.root.join('tmp/caching-dev.txt').exist?
    config.cache_store = :memory_store
    config.public_file_server.headers = {
      'Cache-Control' => "public, max-age=#{2.days.to_i}"
    }
  else
    config.action_controller.perform_caching = false
    config.cache_store = :null_store
  end
  config.action_cable.url = ENV['ACTION_CABLE_URL']
  config.action_cable.allowed_request_origins = ENV['ACTION_CABLE_ALLOWED_ORIGINS'].split(',')
  config.active_storage.service = :local
  config.action_mailer.raise_delivery_errors = false
  config.action_mailer.perform_caching = false
  config.active_support.deprecation = :log
  config.active_support.disallowed_deprecation = :raise
  config.active_support.disallowed_deprecation_warnings = []
  config.active_record.migration_error = :page_load
  config.active_record.verbose_query_logs = true
  config.middleware.use ActionDispatch::Cookies
  config.middleware.use ActionDispatch::Session::CookieStore
  Rails.application.routes.default_url_options[:host] = ENV['RAILS_BACKEND_URL']
  # Action mailer
  config.action_mailer.perform_caching = false
  config.action_mailer.default_url_options = { host: ENV.fetch('HOST_DOMAIN_UAT') }
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.smtp_settings = {
    address: ENV.fetch('SMTP_ADDRESS'),
    port: ENV.fetch('SMTP_PORT'),
    domain: ENV.fetch('SMTP_DOMAIN'),
    user_name: ENV.fetch('SMTP_USERNAME'),
    password: ENV.fetch('SMTP_PASSWORD'),
    authentication: 'plain',
    enable_starttls_auto: true
  }
end
