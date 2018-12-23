require 'rails_helper'

RSpec.describe 'As a user' do
  it 'fills out a form for a new trip' do
    allow_any_instance_of(GoogleCoordinateService).to receive(:get_coordinates).and_return({"lat": 39.7507834, "lng": -104.9964355})
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    visit new_trip_path
    destination = '1331 17th St Denver, CO 80202'
    fill_in :destination, with: destination
    fill_in :radius, with: 5

    check "lot"
    # check "meter"
    click_on 'Search'

    expect(current_path).to eq(results_path)
    expect(page).to have_content("Results:")
    within all(".result")[0] do
      expect(page).to have_content("Name: ")
      expect(page).to have_content("Price: ")
      expect(page).to have_content("Address: ")
      expect(page).to have_content("Distance: ")
      expect(page).to have_content("Lat: ")
      expect(page).to have_content("Lng: ")
    end
  end
end
