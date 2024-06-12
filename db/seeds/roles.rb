# frozen_string_literal: true

roles = YAML.load_file("#{Rails.root}/db/docs/roles.yml")

roles.each do |role_name|
  Role.find_or_initialize_by(name: role_name['name']) do |role|
    role.update!(role_name)
  end
end
puts 'Roles seeding completed........'
