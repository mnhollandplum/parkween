class ResultsController < ApplicationController
  def create
    # Assuming params[:destination] is a real address
    @coordinates = GoogleCoordinateService.new.get_coordinates(params[:destination])
    
    lat = @coordinates[:lat]
    lng = @coordinates[:lng]
    radius = params[:radius]
    address = params[:location]

    @facade = ResultsFacade.new(lat, lng, address, radius)
    render :index
  end

  def index
    @facade = ResultsFacade.new(lat, lng, address, radius)
  end
end
