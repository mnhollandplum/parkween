class User < ApplicationRecord
  validates_presence_of     :google_client_id,
                            :first_name,
                            :last_name,
                            :email,
                            :role
  validates_numericality_of :role

  def self.find_or_create_from_auth_hash(auth)
		where(google_client_id: auth.uid).first_or_initialize.tap do |user|
      user = User.new
      user.role = 0
      # user.provider = auth.provider
			user.google_client_id = auth.uid
			user.first_name = auth.info.first_name
			user.last_name = auth.info.last_name
			user.email = auth.info.email
      user.token = auth.info.token
      # user.refresh_token = auth.info.refresh_token
			user.save!
		end
	end
end
