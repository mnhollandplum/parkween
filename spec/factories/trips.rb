FactoryBot.define do
  factory :trip do
    final_address { "1331 17th St LL100, Denver, CO 80202" }
    chosen_spot { "1744 Market St, Denver, CO 80202" }
    user { nil }
  end
end
