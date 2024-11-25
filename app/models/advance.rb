# frozen_string_literal: true

class Advance < ApplicationRecord
  has_many_attached :files
  has_many_attached :tickets
  has_many :attachments, dependent: :destroy
  belongs_to :user
  has_many :travel_itineraries
  has_one :salary_advance, class_name: 'SalaryAdvance', foreign_key: 'advance_id', dependent: :destroy

  validates :advance_type, :status, :amount, presence: true
  validates :advance_type,
            inclusion: { in: %w[salary_advance other_advance in_country_tour_advance ex_country_tour_advance in_country_dsa_claim ex_country_dsa_claim],
                         message: '%<value>s is not a valid advance type' }
  validates :status,
            inclusion: { in: %w[pending verified confirmed dispatched closed rejected],
                         message: '%<value>s is not a valid status' }

  enum status: {
    pending: 'pending',
    verified: 'verified',
    confirmed: 'confirmed',
    dispatched: 'dispatched',
    closed: 'closed',
    rejected: 'rejected'
  }

  enum advance_type: {
    salary_advance: 'salary_advance',
    other_advance: 'other_advance',
    in_country_tour_advance: 'in_country_tour_advance',
    ex_country_tour_advance: 'ex_country_tour_advance',
    in_country_dsa_claim: 'in_country_dsa_claim',
    ex_country_dsa_claim: 'ex_country_dsa_claim'
  }

  def verifier
    User.find_by(id: verified_by)
  end

  def confirmer
    User.find_by(id: confirmed_by)
  end

  def rejecter
    User.find_by(id: rejected_by)
  end

  def position
    user_detail = Icbs::EmployeeMst.find_by(employeecode: user.username)
    user_detail ? position_title(user_detail.designationid) : nil
  end

  def name
    begin
      employee = Icbs::EmployeeMst.find_by(employeecode: self.user.username)
      if employee
        [employee.firstname, employee.middlename, employee.lastname].compact.join(' ')
      else
        nil
      end
    rescue ActiveRecord::RecordNotFound
      nil
    end
  end

  def position_title(designation_id)
    begin
      Icbs::Designation.find(designation_id).designationname
    rescue ActiveRecord::RecordNotFound
      nil
    end
  end
end
