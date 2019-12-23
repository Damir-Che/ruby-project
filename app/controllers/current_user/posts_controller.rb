module CurrentUser
  class PostsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_post, only: [:show, :edit, :update, :destroy]

    def index
      @posts = current_user.posts
    end

    # 3000/posts/new
    def new
      @post = Post.new
    end

    def create
      @post = Post.new(post_params.merge(user_id:current_user.id))
      @post.save
      if @post.save
        redirect_to current_user_post_path(@post)
      else
        render :new
      end
    end

    def show
      # @post = current_user.posts.find(params[:id])
    end

    def edit
      # @post = Post.find(params[:id])
    end

    def update
      # @post = Post.find(params[:id])
      if @post.update(post_params)
        redirect_to @post
      else
        render :edit
      end
    end

    def destroy
      # @post = Post.find(params[:id])
      @post.destroy
      redirect_to current_user_posts_path #posts_path-ссылка
    end

    private

    def set_post
      @post = Post.find(params[:id])
      unless current_user == @post.user
        redirect_to current_user_posts_path
      end
    end

    def post_params
      params.require(:post).permit(:title, :body)
    end
  end
end
