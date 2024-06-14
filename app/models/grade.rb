class Grade < ApplicationRecord
  has_one :dsa_rate, dependent: :destroy
  validates :name, :category, :position_title, presence: true
  validates :basic_pay, numericality: { greater_than_or_equal_to: 0 }
  validates :category,
            inclusion: { in: %w[manager_specialist administrative_service administrative_support_service operational_service],
                         message: '%<value>s is not a valid category' }

  enum category: {
    manager_specialist: 'Managerial and Specialization(M/S)',
    administrative_service: 'Professional and Administrative Service(PS)',
    administrative_support_service: 'Professional and Administrative Support Service(SS)',
    operational_service:'Operational Service(OS)'
  }
end
