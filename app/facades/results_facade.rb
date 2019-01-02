class ResultsFacade

  attr_reader :destination

  def initialize(lat, lng, destination, radius, lots, meters)
    @lat = lat
    @lng = lng
    @destination = destination
    @radius = radius
    @lots_valid = lots
    @meters_valid = meters
    @_lots
    @_meters
  end

  def lots
    if @lots_valid
      @_lots ||= lot_builder
      return @_lots.find_all do |lot|
        lot.distance <= radius_in_feet
      end
    else
      return []
    end
  end

  def meters
    if @meters_valid
      return sorted_meters
    else
      return []
    end
  end

  def meter_count
    sorted_meters.find_all do |meter|
      meter.distance <= @radius.to_f
    end.count
  end

  def avg_meter_price
    found_meters = sorted_meters.find_all do |meter|
      meter.price != nil
    end
    found_meters.sum do |meter|
      meter.price
    end/found_meters.count
  end

  def avg_lot_price
    lots.sum do |lot|
      lot.price
    end/lots.count
  end

  private

  def meter_builder
    @_meters = meter_service.get_results(@lat, @lng, @radius).map do |meter|
      lat = meter["LATITUDE"]
      lng = meter["LONGITUDE"]
      address = meter["SUB_AREA"]
      price = parse_meter_price(meter["CONFIG_NAME"])
      distance = meter["DISTANCE"]
      Meter.new(lat, lng, address, price, distance)
    end
  end

  def lot_builder
    @_lots = lot_service.get_results(@lat, @lng).map do |lot|
      # How to build location objects without passing in so many
      # variables?
      lat = lot[:lat]
      lng = lot[:lng]
      name = lot[:location_name]
      address = lot[:address]
      price = lot[:price]
      distance = lot[:distance]
      Lot.new(lat, lng, name, address, price, distance)
    end
  end

  def sorted_meters
    @_meters ||= meter_builder
    result =  @_meters.find_all do |meter|
      meter.distance <= radius_in_feet
    end
    result.sort_by do |meter|
      meter.distance
    end
  end

  def radius_in_feet
    @radius.to_f * 5280.0
  end

  def lot_service
    ParkwhizResultsService.new
  end

  def meter_service
    MeterService.new
  end

  def parse_meter_price(config_name)
    if config_name.include? '$'
      price = config_name.split '$'
      price[1][0..3].to_f
    else
      nil
    end
  end
  
end
