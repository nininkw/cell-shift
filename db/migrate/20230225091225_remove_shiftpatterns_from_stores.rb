class RemoveShiftpatternsFromStores < ActiveRecord::Migration[6.1]
  def change
    remove_column :stores, :shift_pattern, :string
    remove_column :stores, :shift_in, :time
    remove_column :stores, :shift_out, :time
  end
end
