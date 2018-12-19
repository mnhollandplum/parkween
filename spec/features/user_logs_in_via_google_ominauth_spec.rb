RSpec.feature "user logs in" do
  scenario "using google oauth2" do
    visit root_path
    click_on "Login"
    auth = stub_omniauth
    user = User.find_or_create_from_auth_hash(auth)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    expect(current_path).to eq("/o/oauth2/auth")
  end
end
