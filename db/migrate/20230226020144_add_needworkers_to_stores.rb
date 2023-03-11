class AddNeedworkersToStores < ActiveRecord::Migration[6.1]
  def change
    add_column :stores, :need_workers, :integer
  end
end
