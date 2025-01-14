# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    username { Faker::Internet.username }
    email { Faker::Internet.email }
    password { 'password' }
    association :role
    association :grade
  end
end
