class Attachment < ApplicationRecord
  belongs_to :advance

  validates :attachment_type, :file_url, presence: true
end
