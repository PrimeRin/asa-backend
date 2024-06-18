# frozen_string_literal: true

FactoryBot.define do
  factory :advance do
    advance_type { 'salary_advance' }
    status { 'pending' }
    amount { 1000 }
    verified_by { nil }
    confirmed_by { nil }
    dispatch_by { nil }
    files { nil }
    association :user
  end
end
