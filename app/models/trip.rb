class Trip < ApplicationRecord
  belongs_to :user
  validates_presence_of :final_address,
                        :chosen_spot
end
