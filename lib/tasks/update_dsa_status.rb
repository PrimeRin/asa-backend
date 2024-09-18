namespace :advances do
  desc 'Update the dsa status'
  task update_dsa_status: :environment do
    Advance.find_each do |advance|
      random_status = statuses.sample
      advance.update(status: random_status)
      puts "Updated Advance ID #{advance.id} to status #{random_status}"
    end

    puts 'Finished updating all advances.'
  end
end