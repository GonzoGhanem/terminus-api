class BondisController < ApplicationController
  
  def list
    bondis = Bondi.all
    render json: bondis
  end
  
  def upcoming
    bondis = Bondi.where("departure > ?", Time.now).first 3
    render json: bondis
  end
end
