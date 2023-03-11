class RemoveBusinessHourFromStores < ActiveRecord::Migration[6.1]
  def change
    remove_column :stores, :business_hour, :time
  end
end
