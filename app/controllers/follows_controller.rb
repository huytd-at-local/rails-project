class FollowsController < ApplicationController
  before_action :ensure_login
  def follow
    if @current_user.id != params[:id].to_i
      follow = Follow.new(follow_user_id: params[:id], follower_id: @current_user.id)
      follow.save
      redirect_to("/users/#{params[:id]}")
    else
      redirect_to("/users/#{params[:id]}")
    end
  end

  def unfollow
    unfollow = Follow.find_by(follow_user_id: params[:id], follower_id: @current_user.id)
    unfollow.destroy
    redirect_to("/users/#{params[:id]}")
  end
end