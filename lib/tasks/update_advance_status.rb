
namespace :advances do
  desc "Randomly update the status of all Advance records"
  task update_status: :environment do
    statuses = %w[pending verified confirmed dispatched rejected closed ]

    Advance.find_each do |advance|
      random_status = statuses.sample
      advance.update(status: random_status)
      puts "Updated Advance ID #{advance.id} to status #{random_status}"
    end

    puts "Finished updating all advances."
  end
end
