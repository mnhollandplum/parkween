require 'rails_helper'

describe 'trip index' do
  context 'as a user' do
    it 'shows history of trips' do
      user_1 = create(:user)
      user_2 = create(:user, google_client_id: "5678")
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user_1)
      trip_1 = create(:trip, user: user_1)
      trip_2 = create(:trip, user: user_2, chosen_spot: "1332 18th Street, Denver, CO 80202")

      visit trips_path

      expect(page).to have_content(trip_1.chosen_spot)
      expect(page).to_not have_content(trip_2.chosen_spot)
  
    end
  end
end
