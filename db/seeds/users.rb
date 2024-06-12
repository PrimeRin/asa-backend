# frozen_string_literal: true

users = [
  { email: 'employee1@gmail.com', role: 'Employee', username: '20240024', password: 'password' },
  { email: 'finance1@gmail.com', role: 'Finance', username: '20240025', password: 'password' },
  { email: 'director1@gmail.com', role: 'Director', username: '20240026', password: 'password' },
  { email: 'administrator@gmail.com', role: 'Administrator', username: '20240034', password: 'password' },
  { email: 'governor1@gmail.com', role: 'Governor', username: '20240044', password: 'password' }
]

users.each do |user_attributes|
  role = Role.find_by(name: user_attributes[:role])
  if role
    user = role.users.find_or_initialize_by(username: user_attributes[:username])
    user.email = user_attributes[:email]
    user.password = user_attributes[:password]
    user.save!
  else
    puts "Role '#{user_attributes[:role]}' not found."
  end
end
