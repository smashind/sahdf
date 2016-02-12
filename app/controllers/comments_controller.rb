class CommentsController < ApplicationController
  def create
  	@comment = current_user.comments.new(comment_params)
  	@post = Post.find(params[:post_id])

  	if @comment.save
  		respond_to do |format|
  			format.js
  			format.html { redirect_to post_path(@post), notice: "Your comment was posted." }
  		end
  	else
  		respond_to do |format|
  			#format.js { render action: "error" }
  			format.html { redirect_to :back, alert: "Your comment wasn't posted." }
  		end
  	end
  end

  def destroy
  end

  private

    def comment_params
    	params.require(:comment).permit(:body, :user_id, :post_id)
    end
end
