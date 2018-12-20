require 'rails_helper'

describe GoogleCoordinateService do
  it 'exists' do
    VCR.use_cassette("google_coord_service") do
    coordinates_service = GoogleCoordinateService.new
    expect(coordinates_service).to be_a(GoogleCoordinateService)
    end
  end
  it 'returns coordinates' do
    VCR.use_cassette("google_coord_service") do
      coordinates_service = GoogleCoordinateService.new
      expect(coordinates_service.get_coordinates("1331 17th St Denver, CO 80202")).to eq({"lat": 39.7507834, "lng": -104.9964355})
    end
  end
end
