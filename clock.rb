require 'clockwork'
require_relative './config/boot'
require_relative './config/environment'


include Clockwork

handler do |job|
  puts "Running #{job}"
end

every(1.day, 'dsa_reminder.job', at: '09:00') { DsaReminderJob.perform_later }

every(1.week, 'db.backup', at: '06:00') do
  app_path = ENV['APP_REPO_PATH']
  puts "Starting weekly database backup at #{Time.now}"
  system("cd #{app_path} && bundle exec rake db:backup")
end
