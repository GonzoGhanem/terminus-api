require 'mechanize'
require 'nokogiri'
require 'time'

desc "Grabs all the Bondi information from Rosario's terminal website. From Rosario to Venado Tuerto."
task :fetch_bondis => :environment do
  Bondi.destroy_all
  agent = Mechanize.new
  agent.get("http://www.terminalrosario.gob.ar/")

  form = agent.page.form_with(:id => "form-buscador")
  form.origen = 2000
  form.destino = 944
  form.submit

  doc = Nokogiri::HTML(agent.page.body)
  doc.css("table#resultados tbody tr").each do |row|
    empresa = row.css("a.detalle_empresa").first.text
    salida = row.css("td.sale").text
    llegada = row.css("td.llega").text
    Bondi.create(
      name: empresa, 
      departure: Time.parse(salida), 
      arrival: Time.parse(llegada)
    )
  end
end
