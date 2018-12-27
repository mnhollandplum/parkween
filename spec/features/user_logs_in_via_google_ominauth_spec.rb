require 'rails_helper'

  context 'as a visitor' do
    it 'I can log in with google with oauth2' do
      def stub_omniauth
        OmniAuth.config.test_mode = true
        OmniAuth.config.mock_auth[:google_oauth2] = OmniAuth::AuthHash.new({'uid'=> '11111111','credentials' => {'token' => '121212121212'},'info' =>{'email'=> "test@user.com", 'name' => "Test User"}})
      end

      stub_omniauth

      visit root_path
      click_link "Login"

      expect(current_path).to eq(new_trip_path)
    end
  end
