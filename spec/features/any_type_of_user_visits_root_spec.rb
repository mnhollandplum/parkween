require 'rails_helper'

describe 'Home Page' do
  context 'any type of user' do
    it 'shows welcome message and links' do
      visit '/'

      expect(page).to have_content("Welcome to")
      expect(page).to have_content("Your Everyday Parking Companion")
      expect(page).to have_link("Login")
    end
  end
end
