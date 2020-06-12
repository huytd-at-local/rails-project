class LikesController < ApplicationController
  before_action :ensure_login
  def create
    like = Like.new(post_id: params[:id], user_id: @current_user.id)
    like.save
    redirect_to("/posts/#{params[:id]}")
  end

  def destroy
    like = Like.find_by(post_id: params[:id], user_id: @current_user.id)
    like.destroy
    redirect_to("/posts/#{params[:id]}")
  end
end
