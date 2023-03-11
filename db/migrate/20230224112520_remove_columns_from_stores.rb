class RemoveColumnsFromStores < ActiveRecord::Migration[6.1]
  def change
    remove_column :stores, :address, :string
    remove_column :stores, :near_stations, :string
  end
end
