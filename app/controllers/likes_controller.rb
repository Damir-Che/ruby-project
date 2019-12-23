class LikesController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    @like = Like.create(user_id: current_user.id, post_id: params[:post_id] )
  end



end