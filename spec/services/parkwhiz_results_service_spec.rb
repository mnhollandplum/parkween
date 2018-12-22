require 'rails_helper'

describe ParkwhizResultsService do
  it 'exists' do
    VCR.use_cassette("parkwhiz_results") do
    service = ParkwhizResultsService.new
    expect(service).to be_a(ParkwhizResultsService)
    end
  end
  it 'returns parking_spaces' do
    VCR.use_cassette("parkwhiz_results") do
      service = ParkwhizResultsService.new
      expect(service.get_results(39.7507834, -104.9964355)).to be_an_instance_of(Array)
    end
  end
end
