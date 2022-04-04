class PostsController < ApplicationController
  def index; end

  def show
    @user_id = params[:user_id]
    @id = params[:id]
  end
end
