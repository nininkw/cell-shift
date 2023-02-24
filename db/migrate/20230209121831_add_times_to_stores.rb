class AddTimesToStores < ActiveRecord::Migration[6.1]
  def change
    add_column :stores, :open_at, :time
    add_column :stores, :close_at, :time
    add_column :stores, :shift_in, :time
    add_column :stores, :shift_out, :time
  end
end
