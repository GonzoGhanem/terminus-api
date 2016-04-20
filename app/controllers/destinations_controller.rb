class DestinationsController < ApplicationController
  
  def index
    destinations = Destination.all.order :name
    render json: destinations
  end
  
end
