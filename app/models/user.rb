class User < ApplicationRecord
  validates_presence_of     :google_client_id,
                            :role
  validates_uniqueness_of :google_client_id
  validates_numericality_of :role
  has_many :trips

  def self.find_or_create_from_auth_hash(auth)
    user = find_or_create_by(google_client_id: auth["uid"])
    user.role = 0
  	user.first_name = auth["info"]["first_name"]
  	user.last_name = auth["info"]["last_name"]
  	user.email = auth["info"]["email"]
    user.token = auth["credentials"]["token"]
    # user.refresh_token = auth.info.refresh_token
  	user.save
    user
  end
end
