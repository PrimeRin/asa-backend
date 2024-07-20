class DsaRateThirdCountry < ApplicationRecord
  validates :country, :rate, presence: true
end
