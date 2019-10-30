class PostsController < ApplicationController
  # posts#index
  def index
    @posts = Post.all
  end

  # 3000/posts/1(id)
  def show
    @post = Post.find(params[:id])
  end
end
