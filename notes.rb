# frozen_string_literal: true

# Rails console
user = User.first
user.profile_pic.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'profile.jpg')),
                        filename: 'profile.jpg', content_type: 'image/jpeg')

# Check profile pic
user = User.find_by(username: 'example_username')
if user.profile_pic.attached?
  puts "Filename: #{user.profile_pic.filename}"
  puts "Content Type: #{user.profile_pic.content_type}"
  puts "Byte Size: #{user.profile_pic.byte_size}"
  puts "URL: #{url_for(user.profile_pic)}"
else
  puts 'No profile picture attached.'
end

advance.files.attach(io: File.open(Rails.root.join('app', 'assets', 'files', 'office_order.pdf')),
                     filename: 'office_order.pdf', content_type: 'application/pdf')
advance.files.each do |file|
  puts "File Name: #{file.filename}"
  puts "File Size: #{file.blob.byte_size} bytes"
end

# check db connection
ActiveRecord::Base.connection_pool.with_connection(&:active?)
