class PostsController < ApplicationController
	def index
		@posts = Post.featured.includes(:user).order('id DESC').paginate(page: params[:page], per_page: 10)
		@post = Post.new
	end

  def show
  	@post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

	def create
		if user_signed_in?
      @post = current_user.posts.new(post_params)
    else
    	@post = Post.new(post_params)
    end

    if @post.save
	    respond_to do |format|
	    	format.html { redirect_to :root, notice: "Your sad funny story was posted!" }
	    	format.js
	    end
	  else
	  	respond_to do |format|
	    	format.html { render :new, alert: "There was a problem." }
	    	format.js { render action: "error" }
	    end	
	  end 
	end

	private

	  def post_params
	  	params.require(:post).permit(:body, :user_id)
	  end
end
