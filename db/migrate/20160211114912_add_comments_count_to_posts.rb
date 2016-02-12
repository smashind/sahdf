class AddCommentsCountToPosts < ActiveRecord::Migration
  def change
  	add_column :posts, :comments_count, :integer, default: 0

  	Post.reset_column_information
  end
end
