require 'rails_helper'

describe GoogleGeolocationService do
  it 'exists' do
    VCR.use_cassette("google_geolocation_service") do
    service = GoogleGeolocationService.new
    expect(service).to be_a(GoogleGeolocationService)
    end
  end
  it 'returns coordinates' do
    VCR.use_cassette("google_geolocation_service") do
      service = GoogleGeolocationService.new
      expect(service.get_geolocation_coordinates).to eq({:lat => 39.751202899999996, :lng => -105.00199309999999})
    end
  end
end
