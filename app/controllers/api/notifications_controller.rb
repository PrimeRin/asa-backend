module Api
  class NotificationsController < ApplicationController
    def create
      @notification = Notification.new(notification_params)
      if @notification.save
        ActionCable.server.broadcast('notifications_channel', { notification: @notification })
        head :ok
      else
        # Handle error
      end
    end

    private

    def notification_params
      params.require(:notification).permit(:sender, :message, recipients: [])
    end
  end
end
