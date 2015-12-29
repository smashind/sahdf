class PostsController < ApplicationController
	def index
		@posts = Post.all
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
	    	format.html { redirect to @post, notice: "Your sad funny story was posted!" }
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
