# frozen_string_literal: true

class Advance < ApplicationRecord
  belongs_to :user

  validates :advance_type, :status, :amount, presence: true
  validates :advance_type,
            inclusion: { in: %w[salary_advance other_advance in_country_tour_advance ex_country_tour_advance],
                         message: '%<value>s is not a valid advance type' }
  validates :status,
            inclusion: { in: %w[pending verified confirmed dispatched closed],
                         message: '%<value>s is not a valid status' }

  enum status: {
    pending: 'pending',
    verified: 'verified',
    confirmed: 'confirmed',
    dispatched: 'dispatched',
    closed: 'closed'
  }

  enum advance_type: {
    salary_advance: 'salary_advance',
    other_advance: 'other_advance',
    in_country_tour_advance: 'in_country_tour_advance',
    ex_country_tour_advance: 'ex_country_tour_advance'
  }

  def verifier
    User.find_by(id: verified_by)
  end

  def confirmer
    User.find_by(id: confirmed_by)
  end

  def dispatcher
    User.find_by(id: dispatch_by)
  end
end
