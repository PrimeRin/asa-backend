# frozen_string_literal: true

rates = YAML.load_file(Rails.root.join('db', 'docs', 'dsa_rates.yml'))

rates.each do |grade_name, rate_attributes|
  grade = Grade.find_by(name: grade_name)
  if grade
    grade.create_dsa_rate(rate_attributes)
  else
    puts "Grade not found for #{grade_name}"
  end
end

puts 'DSA Rate seeding completed........'
