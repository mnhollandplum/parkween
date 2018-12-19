RSpec.feature "user logs in" do
  scenario "using google oauth2" do

    visit root_path
    expect(page).to have_link("Login")
    click_link "Login"

    auth = stub_omniauth

    User.find_or_create_from_auth_hash(auth)

    new_user = User.first

    visit root_path

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(new_user)

    expect(page).to have_link("Logout")

  end
end
