class ChangeDatatypeShiftStabilizeOfUsers < ActiveRecord::Migration[6.1]
  def change
    change_column :users, :shift_stabilize, :integer
  end
end
