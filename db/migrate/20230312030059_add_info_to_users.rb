class AddInfoToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :name, :string
    add_column :users, :wages, :integer
    add_column :users, :dayoff, :date
    add_column :users, :shift_stabilize, :string
    add_column :users, :wday, :string
    add_column :users, :max_work, :integer
    add_column :users, :holiday, :boolean
    add_column :users, :priority, :boolean
  end
end
