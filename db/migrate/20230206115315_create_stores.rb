class CreateStores < ActiveRecord::Migration[6.1]
  def change
    create_table :stores do |t|
      t.string :name
      t.string :address
      t.time :business_hour
      t.string :near_stations
      t.string :shift_pattern
      t.string :shift_schedule
      t.timestamps
    end
  end
end
