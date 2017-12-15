class BondisController < ApplicationController
  
  before_filter :set_params
  
  def list
    bondis = Bondi.from_to @origin, @destination
    render json: bondis
  end
  
  def upcoming
    bondis = Bondi.from_to(@origin, @destination)
    upcoming_bondis = bondis.select do |b|
      Time.parse(b.departure.strftime("%H:%M")) > DateTime.parse(Time.now.in_time_zone.strftime("%H:%M"))
    end.first(3)
    render json: upcoming_bondis
  end

  def details
    bondi = Bondi.find(params[:bondi])
    puts bondi.inspect
    render json: bondi, serializer: BondiDetailSerializer, root: false
  end
  
  private
  def set_params
    @origin = params[:origin]
    @destination = params[:destination]
  end
end
