class BondiSerializer < ActiveModel::Serializer

  attributes :name, :departure, :arrival
  
  def departure
    object.departure.strftime "%H:%M"
  end
  
  def arrival
    object.arrival.strftime "%H:%M"
  end

end
