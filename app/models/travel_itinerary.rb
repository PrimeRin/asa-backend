# frozen_string_literal: true

class TravelItinerary < ApplicationRecord
  belongs_to :advance
  validates :start_date, :end_date, :from, :to, presence: true
  validate :end_date_after_start_date

  private

  def end_date_after_start_date
    return if start_date.blank? || end_date.blank?

    errors.add(:end_date, 'must be greater than start date') if end_date < start_date
  end
end
