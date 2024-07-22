# frozen_string_literal: true

rates = YAML.load_file(Rails.root.join('db', 'docs', 'dsa_rates.yml'))

rates.each do |rate_attributes|
  grade = Icbs::GradeCategory.find_by(categoryname: rate_attributes['grade'])
  if grade
    DsaRate.create(
      from: rate_attributes['from'],
      to: rate_attributes['to'],
      rate: rate_attributes['rate'],
      grade_name: grade.categoryname,
    )
  else
    puts "Grade not found for #{grade_name}"
  end
end

puts 'DSA Rate seeding completed........'
