class Notification < ApplicationRecord
  validates :sender, presence: true
  validates :recipients, presence: true
  validates :message, presence: true
end
