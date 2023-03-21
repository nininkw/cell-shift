class AddInfoToAdmins < ActiveRecord::Migration[6.1]
  def change
    add_column :admins, :name, :string
    add_column :admins, :dayoff, :date
    add_column :admins, :max_work, :integer
    add_column :admins, :priority, :boolean
    add_column :admins, :store_id, :integer
  end
end
