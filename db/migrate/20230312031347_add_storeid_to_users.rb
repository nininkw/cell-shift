class AddStoreidToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :store_id, :integer
  end
end
