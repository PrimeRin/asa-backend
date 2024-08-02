# app/mailers/advance_mailer.rb
class AdvanceMailer < ApplicationMailer
  def advance_email(recipient_id, message)
    @message = message
    @url = ENV['HOST_DOMAIN']
    begin
      user = User.find(recipient_id)
      @user = user
      mail(to: @user.email, subject: 'Advance Notification')
    rescue ActiveRecord::RecordNotFound
      Rails.logger.warn "User with ID #{recipient_id} not found. Skipping."
    end
  end
end
