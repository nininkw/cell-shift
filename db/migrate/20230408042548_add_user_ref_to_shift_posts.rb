class AddUserRefToShiftPosts < ActiveRecord::Migration[6.1]
  def change
    add_reference :shift_posts, :user, null: false, foreign_key: true
  end
end
