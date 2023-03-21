class ChangeDatatypeWdayOfUsers < ActiveRecord::Migration[6.1]
  def change
    change_column :users, :wday, :integer
  end
end
