class Cab < ActiveRecord::Base

  geocoded_by :full_street_address
  after_validation :geocode
  has_many :rides
  validates :plate_num, uniqueness: true

  def full_street_address
    "#{address}, #{city}"
  end

  def book_cab
    self.currently_booked = true
    self.save!
  end

  def end_ride(address)
    self.update_attributes(:currently_booked => false, :address => address)
    ride = self.ongoing_ride
    ride.update_attributes(:end_lat => self.latitude, :end_lng => self.longitude, :end_time => DateTime.now, :in_progress => false)
    ride.calculate_rent
  end

  def ongoing_ride
    rides.where(:in_progress => true).first
  end
end


# rails g model Cab pink_taxi:boolean longitude:float latitude:float currently_booked:boolean city:string address:text plate_num:string
