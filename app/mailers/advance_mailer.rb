# app/mailers/advance_mailer.rb
class AdvanceMailer < ApplicationMailer
  def advance_email(recipient_ids, message)
    @message = message
    @url = ENV['HOST_DOMAIN']

    recipient_ids.each do |recipient_id|
      begin
        user = User.find(recipient_id)
        @user = user
        mail(to: @user.email, subject: 'Advance Notification')
      rescue ActiveRecord::RecordNotFound
        Rails.logger.warn "User with ID #{recipient_id} not found. Skipping."
        next
      end
    end
  end
end
