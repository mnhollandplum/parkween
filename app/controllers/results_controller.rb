class ResultsController < ApplicationController
  def create
    # Assuming params[:destination] is a real address
    cordinates = GoogleCoordinateService.new.get_coordinates(params[:destination])
    lat = cordinates[:lat]
    lng = cordinates[:lng]
    radius = params[:radius]
    address = params[:location]

    @facade = ResultsFacade.new(lat, lng, address, radius)
    render :index
  end

  def index
    @facade = ResultsFacade.new(lat, lng, address, radius)
  end
end
