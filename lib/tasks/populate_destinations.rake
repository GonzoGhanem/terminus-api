desc "Fills the database with Destination information grabed from the Terminal."
task :populate_destinations => :environment do
  COMMON_DESTINATIONS = HashWithIndifferentAccess.new(YAML.load(File.read(File.expand_path('../../../config/destinations.yml', __FILE__))))
  COMMON_DESTINATIONS['ALL_DESTINATIONS'].each do |k,v|
    destination = Destination.find_or_create_by code: k
    destination.update_attribute :name, v
  end
end
