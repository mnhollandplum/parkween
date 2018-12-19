require 'rails_helper'

RSpec.describe User, type: :model do

  it { should validate_presence_of(:google_client_id) }
  # it { should validate_presence_of(:first_name) }
  # it { should validate_presence_of(:last_name) }
  # it { should validate_presence_of(:email) }
  it { should validate_presence_of(:role) }
  it { should validate_numericality_of(:role) }

  require 'rails_helper'

  it "creates or updates itself from an oauth hash" do
    auth = stub_omniauth

    User.find_or_create_from_auth_hash(auth)

    new_user = User.first

    expect(new_user.google_client_id).to eq("12345678910")
    expect(new_user.email).to eq("nikki@holland.com")
    expect(new_user.first_name).to eq("nikki")
    expect(new_user.last_name).to eq("holland")
    expect(new_user.token).to eq("abcdefg12345")
    expect(new_user.refresh_token).to eq("12345abcdefg")
  end
end
