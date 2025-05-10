# app/mailers/password_reset_mailer.rb
class PasswordResetMailer < ApplicationMailer
    def reset_instructions(user, token)
      @user = user
      @token = token
      @reset_url = "#{ENV['HOST_DOMAIN']}/user/resetPassword?reset_password_token=#{token}"
      @icbs_user = icbs_user(@user.username)
      @full_name = user_full_name(@user.username)
  
      mail(
        to: @user.email,
        subject: 'Forgot Password Link(ASA)'
      )
    end
  
    private
  
    def icbs_user(username)
      Icbs::EmployeeMst.find_by(employeecode: username)
    end
  
    def user_full_name(username)
      user = icbs_user(username)
      if user
        [user.firstname, user.middlename, user.lastname].compact.join(' ')
      else
        "User"
      end
    end
  end
