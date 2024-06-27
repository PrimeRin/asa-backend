class SalaryAdvance < ApplicationRecord
  belongs_to :advance

  validates :duration, :deduction, :completion_month, :status, presence: true
end
