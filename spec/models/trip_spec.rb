require 'rails_helper'

RSpec.describe Trip, type: :model do
  it { should validate_presence_of(:start_location) }
  it { should validate_presence_of(:end_location) }
end
