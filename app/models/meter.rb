class Meter

  attr_reader :lat,
              :lng,
              :address,
              :price,
              :distance

  def initialize(lat, lng, address, price, distance)
    @lat = lat
    @lng = lng
    @address = address
    @price = price
    @distance = distance
  end

end
