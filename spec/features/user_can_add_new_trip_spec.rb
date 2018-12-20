require 'rails_helper'

RSpec.describe 'As a user' do
  it 'fills out a form for a new trip' do
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    visit new_trip_path
    fill_in :start_location, with: '123 Main Street'
    fill_in :end_location, with: '321 Main Street'

  end
end
