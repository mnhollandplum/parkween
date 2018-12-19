class Trip < ApplicationRecord
  belongs_to :user
  validates_presence_of :start_location,
                        :end_location
end
