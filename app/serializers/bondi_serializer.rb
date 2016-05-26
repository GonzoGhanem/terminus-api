class BondiSerializer < ActiveModel::Serializer

  attributes :name, :departure, :arrival, :today, :days
  
  def departure
    object.departure.getutc.strftime "%H:%M"
  end
  
  def arrival
    object.arrival.getutc.strftime "%H:%M"
  end
  
  def today
    object.days[Date.today.wday]
  end

end
