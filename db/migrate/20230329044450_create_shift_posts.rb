class CreateShiftPosts < ActiveRecord::Migration[6.1]
  def change
    create_table :shift_posts do |t|
      t.date :post_shift
      
      t.timestamps
    end
  end
end
