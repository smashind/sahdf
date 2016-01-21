class PagesController < ApplicationController
	# The below can be used to block all pages except those that are explicitly
	# allowed in the ability.rb file
	# authorize_resource :class => :pages
  def home
  end

  def new
  	@posts = Post.includes(:user).order('id DESC').paginate(page: params[:page], per_page: 20)
  end

  def about
  end

  def contact
  end
end
