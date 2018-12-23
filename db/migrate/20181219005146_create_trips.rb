class CreateTrips < ActiveRecord::Migration[5.2]
  def change
    create_table :trips do |t|
      t.string :final_address
      t.string :chosen_spot
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
