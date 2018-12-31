require 'csv'
class MeterService

  def get_results(lat, lng, radius)
    meter_data = File.read("./lib/data/parking_meters.csv")
    CSV.parse(meter_data, headers: true).find_all do |meter|
      search_lat = meter["LATITUDE"].to_f
      search_lng = meter["LONGITUDE"].to_f
      meter["DISTANCE"] = Geocoder::Calculations.distance_between([lat,lng],[search_lat, search_lng])
      radius.to_f >= meter["DISTANCE"]
    end
  end
end
