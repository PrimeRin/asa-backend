# frozen_string_literal: true

class TravelItinerary < ApplicationRecord
  belongs_to :advance
  validates :start_date, :end_date, :from, :to, :amount, presence: true
  validate :end_date_after_start_date
  validate :check_amount

  private

  def end_date_after_start_date
    return if start_date.blank? || end_date.blank?

    errors.add(:end_date, 'must be greater than start date') if end_date < start_date
  end

  def check_amount
    return if start_date.blank? || end_date.blank? || advance.user.blank?

    days = (end_date - start_date).to_i + 1
    grade_id = advance.user.grade_id
    dsa_rate = DsaRate.find_by(from: from, to: to, grade_id: grade_id)

    if dsa_rate.present?
      calculated_amount = days * dsa_rate.rate
      errors.add(:amount, "is incorrect, should be #{calculated_amount}") if amount != calculated_amount
    else
      errors.add(:base, "No DsaRate found for the given route and grade")
    end
  end
end
