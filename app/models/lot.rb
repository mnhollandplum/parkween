class Lot

  attr_reader :lat,
              :lng,
              :name,
              :address,
              :price,
              :distance

  def initialize(lat, lng, name, address, price, distance)
    @lat = lat
    @lng = lng
    @name = name
    @address = address
    @price = price
    @distance = distance
  end
  
end
