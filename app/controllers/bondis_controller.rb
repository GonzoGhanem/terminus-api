class BondisController < ApplicationController
  
  before_filter :set_params
  
  def list
    bondis = Bondi.from_to @origin, @destination
    render json: bondis
  end
  
  def upcoming
    bondis = Bondi.from_to(@origin, @destination).next_three_from_now
    render json: bondis
  end
  
  private
  def set_params
    @origin = params[:origin]
    @destination = params[:destination]
  end
end
