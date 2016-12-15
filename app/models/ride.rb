class Ride < ActiveRecord::Base

  belongs_to :cab

  def calculate_rent
    cab = self.cab
    distance = Geocoder::Calculations.distance_between([start_lat,start_lng], [end_lat,end_lng], :units => :km)
    duration = ((end_time - start_time)/1.minute).round
    amount = cab.pink_taxi ? duration * 6 + distance * 7 : duration + distance * 2
    self.update_attributes(:rent_amount => amount)
    amount
  end
end
