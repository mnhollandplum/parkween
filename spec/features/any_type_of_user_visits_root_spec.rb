require 'rails_helper'

describe 'Home Page' do
  context 'any type of user' do
    it 'shows welcome message and links' do
      visit '/'

      expect(page).to have_content("Welcome to")
      expect(page).to have_content("Your Everyday Parking Companion")
      expect(page).to have_link("Login")
    end

    it 'shows login button on /trips for guest user' do
      visit '/trips'

      expect(page).to_not have_content("My Trip History")
      expect(page).to have_link('Login')
    end

    it 'shows login button on /trips/new for guest user' do
      visit '/trips/new'

      expect(page).to have_link('Login')
    end
  end
end
