# frozen_string_literal: true

FactoryBot.define do
  factory :grade do
    name { 'M1' }
    category { 'manager_specialist' }
    position_title { 'Executive Director' }
    basic_pay { 50_000 }
  end
end
