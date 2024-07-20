# frozen_string_literal: true

rates = YAML.load_file("#{Rails.root}/db/docs/dsa_rate_third_countries.yml")

rates.each do |rate_data|
  rate = DsaRateThirdCountry.find_or_initialize_by(country: rate_data['country'])
  rate.rate = rate_data['rate']
  rate.save!
end

puts 'Third country seeding completed........'
