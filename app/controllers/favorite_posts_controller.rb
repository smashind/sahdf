class FavoritePostsController < ApplicationController
	before_action :set_post
  
  def create
  	if Favorite.create(favorited: @post, user: current_user)
  		respond_to do |format|
  			format.html { redirect_to :back, notice: "Favorited!"}
  			format.js
  		end
  	else
  		respond_to do |format|
  			format.html { redirect_to :back, notice: "There was a problem."}
  			format.js { render action: "error" }
  		end
  	end
  end

  def destroy
  	Favorite.find_by(favorited_id: @post.id, user_id: current_user.id).destroy
  	respond_to do |format|
			format.html { redirect_to :back, notice: "Unfavorited!"}
			format.js
		end
  end

	private
	  def set_post
	    @post = Post.find(params[:post_id] || params[:id])
	  end
end