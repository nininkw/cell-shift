class RemoveStartTimeFromShiftPosts < ActiveRecord::Migration[6.1]
  def change
    remove_column :shift_posts, :start_time, :datetime
  end
end
