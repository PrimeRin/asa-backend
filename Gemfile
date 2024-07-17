# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.3.0'
gem 'activerecord-oracle_enhanced-adapter'
gem 'bootsnap', require: false
gem 'devise', '4.9'
gem 'dotenv', require: 'dotenv/load'
gem 'jwt'
gem 'mysql2', '~> 0.5'
gem 'pagy'
gem 'puma', '~> 5.0'
gem 'rack-cors', '~> 2.0'
gem 'rails', '~> 7.0.8', '>= 7.0.8.1'
gem 'rswag'
gem 'rswag-api'
gem 'redis', '3.3.3'
gem 'rswag-ui'
gem 'ruby-oci8'
gem 'sidekiq', '5.0.0'
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
group :development, :test do
  gem 'debug', platforms: %i[mri mingw x64_mingw]
  gem 'factory_bot_rails'
  gem 'faker', '~> 2.19'
  gem 'pry'
  gem 'rack-test', require: 'rack/test'
  gem 'rspec'
  gem 'rspec-rails'
  gem 'rswag-specs'
  gem 'rubocop', require: false
end

group :development do
end
