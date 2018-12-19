class User < ApplicationRecord
  validates_presence_of     :google_client_id,
                            :first_name,
                            :last_name,
                            :email,
                            :token,
                            :role
  validates_numericality_of :role
end
