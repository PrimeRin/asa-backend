require 'clockwork'
require_relative './config/boot'
require_relative './config/environment'


include Clockwork

handler do |job|
  puts "Running #{job}"
end

every(1.day, 'dsa_reminder.job', at: '09:00') { DsaReminderJob.perform_later }
# every(10.seconds, 'dsa_reminder_job') { DsaReminderJob.perform_later }
