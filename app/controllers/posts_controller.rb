class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
  end

  def show
    @post = Post.includes(:comments).find(params[:id])
  end

  def new; end

  def create
    @post = current_user.posts.new(params.require(:post).permit(:title, :text))
    respond_to do |format|
      format.html do
        if @post.save
          flash[:success] = 'Post created successfully'
          redirect_to new_user_post_path
        else
          flash.now[:error] = 'Error: Post could not be saved'
          render :new, locals: { post: @post }
        end
      end
    end
  end
end
