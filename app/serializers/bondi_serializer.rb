class BondiSerializer < ActiveModel::Serializer

  attributes :name, :departure, :arrival, :today, :days
  
  def departure
    object.departure.strftime "%H:%M"
  end
  
  def arrival
    object.arrival.strftime "%H:%M"
  end
  
  def today
    object.days[Date.today.wday]
  end

end
