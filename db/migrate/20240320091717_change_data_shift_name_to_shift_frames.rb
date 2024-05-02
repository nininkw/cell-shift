class ChangeDataShiftNameToShiftFrames < ActiveRecord::Migration[6.1]
  def up
    change_column :shift_frames, :shift_name, :integer, using: "shift_name::integer"
  end

  def down
    change_column :shift_frames, :shift_name, :string
  end
end
