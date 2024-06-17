class Notification < ApplicationRecord
  serialize :recipients, Array
  validates :sender, presence: true
  validates :recipients, presence: true
  validates :message, presence: true
end
