require 'rails_helper'

RSpec.describe 'As a user' do
  it 'fills out a form for a new trip' do
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    visit new_trip_path
    destination = '321 Main Street'
    fill_in :destination, with: destination
    fill_in :radius, with: 5

    check "lot"
    check "meter"
    click_on 'Search'

    # expect(current_path).to eq(trip_path)
    # expect(page).to have_content(destination)
  end
end
