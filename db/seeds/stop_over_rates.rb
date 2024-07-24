# frozen_string_literal: true

stop_over_rates = YAML.load_file("#{Rails.root}/db/docs/stop_over_rates.yml")

stop_over_rates.each do |rate_data|
  StopOverRate.create(rate_data)
end

puts 'Stop Over Rate seeding completed........'