class DropAdmins < ActiveRecord::Migration[6.1]
  def change
    drop_table :admins do
    end 
  end
end
