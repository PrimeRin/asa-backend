# frozen_string_literal: true

Devise.setup do |config|
  # config.mailer_sender = 'please-change-me-at-config-initializers-devise@example.com'
  require 'devise/orm/active_record'
  config.authentication_keys = [:username]
  config.case_insensitive_keys = [:username]
  config.strip_whitespace_keys = [:username]
end
