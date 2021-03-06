class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts.includes(:comments)
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
          redirect_to user_posts_path, notice: 'Post created successfully'
        else
          flash.now[:error] = 'Error: Post could not be saved'
          render :new, locals: { post: @post }
        end
      end
    end
  end
end
