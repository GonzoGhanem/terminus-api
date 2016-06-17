class BondiDetailSerializer < ActiveModel::Serializer

  attributes :id, :name, :departure, :arrival, :today, :days, :route_details
  
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
