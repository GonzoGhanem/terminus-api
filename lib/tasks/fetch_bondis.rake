require 'mechanize'
require 'nokogiri'
require 'time'

desc "Grabs all the Bondi information from Rosario's terminal website. From Rosario to Venado Tuerto."
task :fetch_bondis => :environment do
  path_array = Destination.possible_paths

  path_array.each do |path|
    origin = path[0]
    destination = path[1]
    Bondi.where(origin: origin, destination: destination).destroy_all
    agent = Mechanize.new
    agent.get("http://www.terminalrosario.gob.ar/")
    form = agent.page.form_with(:id => "formulario_flotante")
    form.origen = origin
    form.destino = destination
    form.submit
    
    doc = Nokogiri::HTML(agent.page.body)
    loop do

      doc.css("table#resultados tbody tr").each do |row|
        empresa = row.css("a.detalle_empresa").first.text
        salida = row.css("td.sale").text
        llegada = row.css("td.llega").text
        url_detalle = row.css("td:last-child").first.css('a').last.attr(:href)
        dias = []
        row.css("td.dias").each do |d|
          dias << get_availability(d.css('.yes-no'))
        end

        Bondi.create(
          name: empresa, 
          departure: Time.zone.parse(salida) + 1.day,
          arrival: Time.zone.parse(llegada),
          origin: origin,
          destination: destination,
          days: dias,
          detail_url: url_detalle
        )
      end

      next_page = doc.css("aresultados_next")
      break if next_page.empty?
      next_page.click
    end
    
  end
end

def get_availability(image)
  image[0][:src] == "http://www.terminalrosario.gob.ar/wp-content/themes/terminal-rosario/images/table-icon-yes.png"
end
