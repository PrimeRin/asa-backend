# frozen_string_literal: true

users = YAML.load_file("#{Rails.root}/db/docs/users.yml")
users.each do |user_attributes|
  role = Role.find_by(name: user_attributes['role'])
  grade = Grade.find_by(name: 'M1')
  if role
    user = role.users.find_or_initialize_by(username: user_attributes['username'])
    user.email = user_attributes['email']
    user.password = user_attributes['password']
    user.name = user_attributes['name']
    user.mobile_number = user_attributes['mobile_number']
    user.grade = grade
    user.save!
  else
    puts "Role '#{user_attributes[:role]}' not found."
  end
end
puts 'Users seeding completed........'
