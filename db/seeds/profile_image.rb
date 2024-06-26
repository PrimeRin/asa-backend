# frozen_string_literal: true

User.find_each do |user|
  unless user.profile_pic.attached?
    file_path = Rails.root.join('app', 'assets', 'images', 'profile.jpg')
    File.open(file_path, 'rb') do |file|
      user.profile_pic.attach(io: file, filename: 'profile.jpg', content_type: 'image/jpeg')
    end
  end
end
puts 'Profile Image seeding completed........'
