class DsaReminderJob < ApplicationJob
  queue_as :default

  REMINDER_MESSAGE = 'Reminder to submit your DSA (Daily Subsistence Allowance) claim for the for the recent tour advance.'\
                     'Please ensure the submission is completed at the earliest, as delays may cause issues with the future advance process.'

  def perform
    send_mail(user_ids, REMINDER_MESSAGE)
  end

  private

  def user_ids
    advance_not_closed_user_ids = Advance.where(advance_type: ['in_country_tour_advance', 'ex_country_tour_advance'])
                                         .where(status: 'dispatched') 
                                         .where('created_at <= ?', 15.days.ago)
                                         .pluck(:user_id) 
  end

  def send_mail(recipients, message)
    recipients.each do |recipient|
      AdvanceEmailJob.perform_later(recipient, message)
    end
  end
end