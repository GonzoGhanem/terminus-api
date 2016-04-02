desc "Fills the database with Destination information grabed from the Terminal."
task :populate_destinations => :environment do
  COMMON_DESTINATIONS = {
    944 => 'Venado Tuerto',
    2000 => 'Rosario',
    828 => 'Rufino',
    448 => 'Firmat',
    221 => 'Casilda',
    66357 => 'Pergamino',
    99902 => 'San Nicolás',
    929 => 'Teodelina',
    650 => 'Las Parejas',
    3083 => 'La Plata',
    66669 => 'Retiro',
    3399 => 'Mar del Plata',
    7517 => 'Laboulaye',
    15954 => 'Merlo (San Luis)',
    3510 => 'Merlo (Bs. As.)',
    23652 => 'Villa Gessel',
    8130 => 'Río Cuarto'
  }.each do |k,v|
    destination = Destination.find_or_create_by code: k
    destination.update_attribute :name, v
  end
end
