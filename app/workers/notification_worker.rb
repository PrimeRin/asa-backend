class NotificationWorker
  include Sidekiq::Worker

  def perform(notification_params)
    notification = Notification.new(notification_params)
    if notification.save
      ActionCable.server.broadcast('notifications_channel', { notification: notification })
    else
      # TODO
    end
  end
end
