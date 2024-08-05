class AdvanceEmailJob < ApplicationJob
  queue_as :default

  def perform(recipient_id, message)
    AdvanceMailer.advance_email(recipient_id, message).deliver_now
  end
end

