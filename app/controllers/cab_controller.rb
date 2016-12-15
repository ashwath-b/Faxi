class CabController < ApplicationController

  def index
    @cabs = Cab.where(:currently_booked => false)
    @hash = Gmaps4rails.build_markers(@cabs) do |cab, marker|
      marker.lat cab.latitude
      marker.lng cab.longitude
      marker.infowindow "#{cab.model}, #{cab.plate_num}"
    end
    respond_to do |format|
			format.html
      format.json { render :json => @hash, :status => 200 }
		end
  end

  def end_ride
    cab = Cab.find(params["cab_id"])
    if cab.currently_booked == true
      amount = cab.end_ride(params["address"])
      render :json => amount, status: 200
    else
      flash[:error] = "Something went wrong!!"
      render json: flash
    end
  end

  def book_cab
    cab = Cab.near([params["lat"].to_f, params["lng"].to_f], 10, :units => :km)
    cab = cab.where(:pink_taxi => true) if params["pink_taxi"]
    if cab.length > 0
      cab = cab.first
      Ride.create(:cab_id => cab.id, :start_lat => cab.latitude, :start_lng => cab.longitude, :start_time => DateTime.now, :in_progress => true) if cab.book_cab
      render :json => cab, status: 200
    else
      flash[:error] = "No taxi available within 10 kms right now!!"
      render json: flash
    end
  end

  private

  def cab_params
    params.require(:cab).permit(:city, :address, :plate_num, :model)
  end
end
