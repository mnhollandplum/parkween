require 'rails_helper'

RSpec.describe Trip, type: :model do
  it { should validate_presence_of(:final_address) }
  it { should validate_presence_of(:chosen_spot) }
end
