class Notification < ApplicationRecord
  serialize :recipients, Array
  validates :sender, presence: true
  validates :recipients, presence: true
  validates :message, presence: true

  after_create_commit { broadcast_notification }

  private

  def broadcast_notification
    recipients.each do |recipient|
      Rails.logger.debug "Broadcasting to notifications_channel_#{recipient}"
      ActionCable.server.broadcast("notifications_channel_#{recipient}", {
                                     sender: sender,
                                     recipients: recipients,
                                     message: message,
                                     created_at: created_at,
                                     detail_url: detail_url
                                   })
    end
  end
end
