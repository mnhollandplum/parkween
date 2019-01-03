class ParkwhizResultsService

  def get_results(search_lat, search_lng)
    params = {
              lat: search_lat,
              lng: search_lng,
              sort: distance
    }
    get_json("/search", params)[:parking_listings]
  end

  private

  def conn
    Faraday.new(url:"https://api.parkwhiz.com") do |faraday|
      faraday.params["key"] = ENV['PARKWHIZ_API_KEY']
      faraday.adapter Faraday.default_adapter
    end
  end

  def get_json(url, params={})
    JSON.parse(conn.get(url, default_params.merge(params)).body, symbolize_names: true)
  end

  def default_params
    {
      key: ENV['PARKWHIZ_API_KEY']
    }
  end
end
