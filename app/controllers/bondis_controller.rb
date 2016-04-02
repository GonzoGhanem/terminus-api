class BondisController < ApplicationController
  
  before_filter :set_params
  
  def list
    bondis = Bondi.from_to @origin, @destination
    render json: bondis
  end
  
  def upcoming
    bondis = Bondi.from_to(@origin, @destination)
    .order(departure: :desc)
    .select do |bondi|
      bondi.get_departure_date_time > Time.current
    end.first(3).reverse
    render json: bondis
  end
  
  private
  def set_params
    @origin = params[:origin]
    @destination = params[:destination]
  end
end
