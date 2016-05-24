require 'time'

desc "Takes all the Bondis saved and updates the day to Today"
task :update_bondis => :environment do
  Bondi.all.each do |bondi|
    new_date = bondi.departure + 1.day
    bondi.update_attribute(:departure, new_date)
  end
end
