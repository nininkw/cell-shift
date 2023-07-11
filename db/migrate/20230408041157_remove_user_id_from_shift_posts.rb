class RemoveUserIdFromShiftPosts < ActiveRecord::Migration[6.1]
  def change
    remove_column :shift_posts, :user_id, :bigint
  end
end
