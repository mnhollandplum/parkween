class ParkwhizResultsService

  def get_results(search_lat, search_lng)
    get_json("/search/json?key=#{ENV['PARKWHIZ_API_KEY']}&lat=#{search_lat}&lng=#{search_lng}&sort=distance")
  end
  private
  def conn
    Faraday.new(url:"http://api.parkwhiz.com/search/json?key=d1ec881e8951e9bfaed1efbc4b0ed84daac67303&lat=39.7507834&lng=-104.9964355&sort=distance") do |faraday|
      faraday.params["key"] = ENV['PARKWHIZ_API_KEY']
      faraday.adapter Faraday.default_adapter
    end
  end
  def get_json(url)
    require "pry"; binding.pry
    JSON.parse(conn.get(url).body, symbolize_names: true)
  end
end
