# app/channels/notifications_channel.rb
class NotificationsChannel < ApplicationCable::Channel
  def subscribed
    if (user_id = verify_token(params[:token]))
      current_user = User.find_by(id: user_id)
      stream_from "notifications_channel_#{current_user.id}"

      all_notifications = Notification.all
      filtered_notifications = all_notifications.select do |notification|
        notification.recipients.include?(current_user.id)
      end
      filtered_notifications.each do |notification|
        transmit_notification(notification)
      end
    else
      reject_unauthorized_connection
    end
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  private

  def verify_token(token)
    decoded_token = JwtService.decode(token.split(' ').last)
    decoded_token[:user_id] if decoded_token
  end

  def transmit_notification(notification)
    transmit(
      {
        sender: notification.sender,
       recipients: notification.recipients,
       message: notification.message,
       created_at: notification.created_at,
       detail_url: notification.detail_url
    }
    )
  end
end
