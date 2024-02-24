class AddStartTimeToShiftPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :shift_posts, :start_time, :datetime
  end
end
