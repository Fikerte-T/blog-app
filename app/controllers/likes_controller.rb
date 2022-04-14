class LikesController < ApplicationController
    def create
        @post = Post.find(params[:post_id])
        @like = current_user.likes.new(post_id: @post.id, author_id: current_user.id)
        respond_to do |format|
            format.html do
                if @like.save
                    flash[:success] = "Like updated successfully"
                    redirect_to user_post_path(:id => @post.id)
                else
                    flash.now[:error] = "Error: Likes could not be updated"
                    render :new, locals: {like: @like}
                end
            end
        end
    end    
  
end
