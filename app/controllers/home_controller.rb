class HomeController < ApplicationController
  before_action :authenticate_user!

  def users
    @users = User.all.order('created_at DESC').page(params[:page]).per_page(4)
  end

  def profile
    @user = User.find(params[:id])
  end

  def follow
    @followee_id = params[:followee_id]
    @post=Post.find(params[:post].to_i)
    if current_user.can_follow @followee_id
    FollowMapping.create(:followee_id => @followee_id, :follower_id => current_user.id)
    end
    respond_to do |format|
      format.html { redirect_to :back }
      format.js
    end
  end

  def unfollow
    @followee_id = params[:followee_id]
    @post=Post.find(params[:post].to_i)
    if current_user.can_unfollow @followee_id
      FollowMapping.where(:followee_id => @followee_id, :follower_id => current_user.id).first.destroy
    end
    respond_to do |format|
      format.html { redirect_to :back }
      format.js
    end
  end

end
