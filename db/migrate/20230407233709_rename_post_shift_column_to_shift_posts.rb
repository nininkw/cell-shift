class RenamePostShiftColumnToShiftPosts < ActiveRecord::Migration[6.1]
  def change
    rename_column :shift_posts, :post_shift, :selected_dates
  end
end
