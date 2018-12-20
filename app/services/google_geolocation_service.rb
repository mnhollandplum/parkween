class GoogleCoordinateService

  def get_geolocation_coordinates
    get_json("/geolocation/v1/geolocate?")[:location]
    #this will return the value of location{:lat => x, :lng=>x}
  end
  private
  def conn
    Faraday.new(url:"https://www.googleapis.com") do |faraday|
      faraday.params["key"] = ENV['GOOGLE_API_KEY']
      faraday.adapter Faraday.default_adapter
    end
  end

  def get_json(url)
    JSON.parse(conn.get(url).body, symbolize_names: true)
  end
end
