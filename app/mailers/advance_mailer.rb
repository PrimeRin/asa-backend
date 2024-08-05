# app/mailers/advance_mailer.rb
class AdvanceMailer < ApplicationMailer
  def advance_email(recipient_id, message)
    @message = message
    @url = ENV['HOST_DOMAIN']
    user = User.find_by(id: recipient_id)
    if user
      @user = user
      mail(to: @user.email, subject: 'Advance Notification')
    else
      Rails.logger.warn "User with ID #{recipient_id} not found. Skipping."
    end
  end
end
