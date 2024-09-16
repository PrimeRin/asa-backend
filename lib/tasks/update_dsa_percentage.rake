namespace :dsa do
  desc 'Update the dsa percentage'
  task update_dsa_percentage: :environment do
    TravelItinerary.where(dsa_percentage: "0.7").update_all(dsa_percentage: "7/10")
    TravelItinerary.where(dsa_percentage: "0.5").update_all(dsa_percentage: "1/2")
    TravelItinerary.where(dsa_percentage: "1").update_all(dsa_percentage: "1")
    puts 'Finished updating all DSA percentages'
  end
end
