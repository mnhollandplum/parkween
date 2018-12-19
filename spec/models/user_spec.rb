require 'rails_helper'

RSpec.describe User, type: :model do

  it { should validate_presence_of(:google_client_id) }
  it { should validate_presence_of(:first_name) }
  it { should validate_presence_of(:last_name) }
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:token) }
  it { should validate_presence_of(:role) }
  it { should validate_numericality_of(:role) }

end
