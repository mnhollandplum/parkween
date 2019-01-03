class TripsController < ApplicationController

  def index
    if current_user
      @trip_count = Trip.count
      @updated_at = Trip.maximum(:updated_at)
    else
      redirect_to root_path
    end
  end

  def show

  end

  def new

  end

  def create
    destination = params[:destination_address]
    chosen_spot = params[:location]
    Trip.create(final_address: destination, chosen_spot: chosen_spot, user_id: current_user.id)
    redirect_to trips_path
  end
end
