class CreateShiftFrames < ActiveRecord::Migration[6.1]
  def change
    create_table :shift_frames do |t|
      t.string :shift_name
      t.time :start_at
      t.time :finish_at
      t.references :store, null: false, foreign_key: true

      t.timestamps
    end
  end
end
