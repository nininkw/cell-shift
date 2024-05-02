class DropAdmins < ActiveRecord::Migration[6.1]
  def change
    if table_exists?(:admins)
      drop_table :admins
    end
  end
end
