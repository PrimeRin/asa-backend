# app/mailers/advance_mailer.rb
class AdvanceMailer < ApplicationMailer
  def advance_email(recipient_id, message)
    @message = message
    @url = ENV['HOST_DOMAIN']
    user = User.find_by(id: recipient_id)
    if user
      @icbs_user_name = user_full_name(user.username)
      mail(to: @user.email, subject: 'Salary Advance and DSA Notification')
    else
      Rails.logger.warn "User with ID #{recipient_id} not found. Skipping."
    end
  end

  def icbs_user(username)
    icbs_user = Icbs::EmployeeMst.find_by(employeecode: username)
  end

  def user_full_name(username)
    user = icbs_user(username)
    if user
      [user.firstname, user.middlename, user.lastname].compact.join(' ')
    else
      "Unknown User"
    end
  end
end
