require 'rails_helper'

describe 'Results page shows stats' do
  context 'as a user' do
    it 'shows stats about the meters in the area' do
      allow_any_instance_of(GoogleCoordinateService).to receive(:get_coordinates).and_return({"lat": 39.7507834, "lng": -104.9964355})
      user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      visit new_trip_path
      destination = '1331 17th St Denver, CO 80202'
      fill_in :destination, with: destination
      fill_in :radius, with: 5
      check "meter"
      click_on 'Search'

      expect(page).to have_content("Meters In Search Radius: 6221")
      expect(page).to have_content("Average Meter Price: $0.98")
    end

    it 'shows stats about the lots in the area' do
      allow_any_instance_of(GoogleCoordinateService).to receive(:get_coordinates).and_return({"lat": 39.7507834, "lng": -104.9964355})
      user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      visit new_trip_path
      destination = '1331 17th St Denver, CO 80202'
      fill_in :destination, with: destination
      fill_in :radius, with: 5
      check "lot"
      click_on 'Search'

      expect(page).to have_content("Lots In Search Radius:")
      expect(page).to have_content("Average Lot Price:")
    end
  end
end
