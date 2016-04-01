desc "Fills the database with Destination information grabed from the Terminal."
task :populate_destinations => :environment do
  COMMON_DESTINATIONS = {
    944 => 'Venado Tuerto',
    2000 => 'Rosario'
  }.each do |k,v|
    destination = Destination.find_or_create_by code: k
    destination.update_attribute :name, v
  end
end
