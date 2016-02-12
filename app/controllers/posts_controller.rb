class PostsController < ApplicationController
	def index
		@posts = Post.featured.includes(:user).order('id DESC').paginate(page: params[:page], per_page: 10)
		@post = Post.new
	end

  def show
  	@post = Post.find(params[:id])
  	@comment = Comment.new
  	@comments = @post.comments.includes(:user)
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
	    	format.html { redirect_to :root, alert: "There was a problem." }
	    	if params[:submit_post_button_form]
	    		format.js { render action: "form_error" }
	    	else
	    	  format.js { render action: "error" }
	    	end
	    end	
	  end 
	end

	def sad_vote
		@post = Post.find(params[:post_id])
		@post.increment!(:sad_votes, 1)
		respond_to do |format|
			format.html { redirect_to :back, notice: "Voted sad!" }
			format.js { render action: "sad-voted" }
		end
	end

	def funny_vote
		@post = Post.find(params[:post_id])
		@post.increment!(:funny_votes, 1)
		respond_to do |format|
			format.html { redirect_to :back, notice: "Voted funny!" }
			format.js { render action: "funny-voted" }
		end
	end

	private

	  def post_params
	  	params.require(:post).permit(:body, :user_id, :picture)
	  end
end
