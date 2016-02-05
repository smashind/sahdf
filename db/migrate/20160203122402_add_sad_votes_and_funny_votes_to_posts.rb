class AddSadVotesAndFunnyVotesToPosts < ActiveRecord::Migration
  def change
  	add_column :posts, :sad_votes, :integer, default: 0
  	add_column :posts, :funny_votes, :integer, default: 0
  end
end
