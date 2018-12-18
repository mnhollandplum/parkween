require 'rails_helper'

describe 'Nav Bar' do
  context 'As a visitor' do
    it 'navigates visitor' do
      visit '/'

      click_on 'About'
      expect(current_path).to eq('/about')
      click_on 'ParKween'
      expect(current_path).to eq('/')
    end

    it 'does not show links for logged in users' do
      visit '/'

      expect(page).to have_no_content('Logout')
      expect(page).to have_no_content('New Trip')
      expect(page).to have_no_content('Trips')
    end
  end
end
