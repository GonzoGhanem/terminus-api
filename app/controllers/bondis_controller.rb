class BondisController < ApplicationController
  
  before_filter :set_params
  
  def list
    bondis = Bondi.from_to @origin, @destination
    render json: bondis
  end
  
  def upcoming
    bondis = Bondi.from_to(@origin, @destination) #.next_three_from_now
    upcoming_bondis = bondis.select do |b|
      Time.parse(b.departure.strftime("%H:%M")) > Time.now
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
