class RequestsController < ApplicationController
  
  def create
    request = Request.create(text: params[:text], email: params[:email], request_date: Date.today(), status: "PENDING")
    render json: request
  end
  
end
