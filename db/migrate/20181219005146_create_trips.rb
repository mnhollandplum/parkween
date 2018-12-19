class CreateTrips < ActiveRecord::Migration[5.2]
  def change
    create_table :trips do |t|
      t.string :start_location
      t.string :end_location
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
