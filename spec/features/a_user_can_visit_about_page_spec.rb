require 'rails_helper'
describe 'as a user' do
  it 'displays an about page'do
    visit '/'
    click_on 'About'

    expect(current_path).to eq(about_path)
    expect(page).to have_content("Credits")
    expect(page).to have_content("Check out the code")
    expect(page).to have_css(".code")
    expect(page).to have_css(".credits")
    expect(page).to have_link("here")
  end
end
