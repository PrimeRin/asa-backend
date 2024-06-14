# frozen_string_literal: true

grades = YAML.load_file("#{Rails.root}/db/docs/grades.yml")

grades.each do |grade_attributes|
  Grade.find_or_initialize_by(name: grade_attributes['name']) do |grade|
    grade.update!(grade_attributes)
  end
end
puts 'Grade seeding completed........'
