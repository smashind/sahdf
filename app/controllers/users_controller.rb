class UsersController < ApplicationController

  def show
  	@user = User.find(params[:id])
  	@posts = @user.posts.order("id DESC").paginate(page: params[:posts_page], per_page: 5)
  	@favorites = @user.favorite_posts.includes(:user).order("id DESC").paginate(page: params[:favorites_page], per_page: 5)
  end
end