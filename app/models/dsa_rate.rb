class DsaRate < ApplicationRecord
  belongs_to :grade

  validates :from, :to, :rate, presence: true
  validates :rate, numericality: { greater_than_or_equal_to: 0 }
end
