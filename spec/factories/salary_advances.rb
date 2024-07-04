FactoryBot.define do
  factory :salary_advance do
    duration { 1 }
    deduction { 'MyString' }
    completion_month { '2024-06-27' }
    status { 'MyString' }
    advance { nil }
  end
end
