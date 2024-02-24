class AddUserIdToShiftPosts < ActiveRecord::Migration[6.1]
  def change
    add_reference :shift_posts, :user, foreign_key: true
  end
end
