class ResultsController < ApplicationController
  def create
    # Assuming params[:destination] is a real address
    @coordinates = GoogleCoordinateService.new.get_coordinates(params[:destination])

    lat = @coordinates[:lat]
    lng = @coordinates[:lng]
    radius = params[:radius]
    address = params[:destination]
    lot = true if params[:lot]
    meter = true if params[:meter]

    @facade = ResultsFacade.new(lat, lng, address, radius, lot, meter)
    render :index
  end

  def index
  end
end
