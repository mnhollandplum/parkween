class ParkwhizResultsService
  def get_results(search_lat, search_lng)
    get_json("/search/?key=#{ENV['PARKWHIZ_API_KEY']}&lat=#{search_lat}&lng=#{search_lng}&sort=distance")[:parking_listings]
  end

  private

  def conn
    Faraday.new(url:"https://api.parkwhiz.com") do |faraday|
      faraday.params["key"] = ENV['PARKWHIZ_API_KEY']
      faraday.adapter Faraday.default_adapter
    end
  end

  def get_json(url)
    JSON.parse(conn.get(url).body, symbolize_names: true)
  end
end
