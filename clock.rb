require 'clockwork'
require_relative './config/boot'
require_relative './config/environment'


include Clockwork

handler do |job|
  puts "Running #{job}"
end

# every(1.day, 'dsa_reminder.job', at: '09:00') { DsaReminderJob.perform_later }
# every(10.seconds, 'dsa_reminder_job') { DsaReminderJob.perform_later }
every(5.minutes, 'db.backup') do
  app_path = ENV['APP_REPO_PATH']
  puts "Starting weekly database backup at #{Time.now}"
  system("cd #{app_path} && bundle exec rake db:backup")
end

# every(1.week, 'db.backup', at: '02:00') do
#   puts "Starting weekly database backup at #{Time.now}"
#   system("cd /home/prime/Desktop/rma/asa-backend && bundle exec rake db:backup")
# end