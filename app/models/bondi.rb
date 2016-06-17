class Bondi < ActiveRecord::Base
  
  scope :from_to, ->(origin,destination) { where("origin = ? AND destination = ?", origin, destination) }
  scope :next_three_from_now, -> { where('departure > ?', Time.current).first(3) } 

  def route_details
    require 'mechanize'
    require 'nokogiri'
    agent = Mechanize.new
    agent.get(self.detail_url)
    doc = Nokogiri::HTML(agent.page.body)
    table = doc.css('table')
    table.css('tr').map do |row|
      {
        city: format(row.css('.empresa.origen').text),
        time: format(row.css('.horario').text),
        observations: format(row.css('.obs').text)
      }
    end
  end

  private 

  def format(the_text)
    the_text.force_encoding("UTF-8").encode("UTF-8")
  end
end
