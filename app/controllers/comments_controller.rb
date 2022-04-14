class CommentsController < ApplicationController
 
    def create
        @post = Post.find(params[:post_id])
        @comment = current_user.comments.new(text: comment_parameters[:text], post_id: @post.id, author_id: current_user.id)
        respond_to do |format|
            format.html do
                if @comment.save
                    flash[:success] = "Comment created successfully"
                    redirect_to user_post_path(:id => @post.id)
                else
                    flash.now[:error] = "Error: comment could not be saved"
                    render :new, locals: {comment: @comment}
                end
            end
        end
    end    
    def comment_parameters
        params.require(:comment).permit(:text)
    end
end
