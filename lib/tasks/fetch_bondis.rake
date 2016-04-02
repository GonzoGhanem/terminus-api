require 'mechanize'
require 'nokogiri'
require 'time'

desc "Grabs all the Bondi information from Rosario's terminal website. From Rosario to Venado Tuerto."
task :fetch_bondis => :environment do
  Bondi.destroy_all
  path_array = Destination.possible_paths

  path_array.each do |path|
    origin = path[0]
    destination = path[1]

    agent = Mechanize.new
    agent.get("http://www.terminalrosario.gob.ar/")
    form = agent.page.form_with(:id => "form-buscador")
    form.origen = origin
    form.destino = destination
    form.submit
    
    doc = Nokogiri::HTML(agent.page.body)
    loop do

      doc.css("table#resultados tbody tr").each do |row|
        empresa = row.css("a.detalle_empresa").first.text
        salida = row.css("td.sale").text
        llegada = row.css("td.llega").text
        
        Bondi.create(
          name: empresa, 
          departure: Time.parse(salida), 
          arrival: Time.parse(llegada),
          origin: origin,
          destination: destination
        )
      end

      next_page = doc.css("aresultados_next")
      break if next_page.empty?
      next_page.click
    end
    
  end
end
