class HomeController < ApplicationController
  before_action :authenticate_user!

  def users
    @users = User.all.order('created_at DESC').page(params[:page]).per_page(6)
  end

  def profile
    @user = User.find(params[:id])
  end

  def follow
    @followee_id = params[:followee_id]
    if current_user.can_follow @followee_id
      FollowMapping.create(:followee_id => @followee_id, :follower_id => current_user.id)
    end
    #byebug
    if params[:post]
      @post = Post.find(params[:post].to_i)
      @user = @post.user
      respond_to do |format|
        format.html { redirect_to :back }
        format.js
      end
    else
      @user = User.find(params[:followee_id])
      respond_to do |format|
        format.html { redirect_to :back }
        format.js { render :action => 'follow_2' }
      end
    end

  end

  def unfollow
    @followee_id = params[:followee_id]
    if current_user.can_unfollow @followee_id
      FollowMapping.where(:followee_id => @followee_id, :follower_id => current_user.id).first.destroy
    end
    if params[:post]
      @post = Post.find(params[:post].to_i)
      @user = @post.user
      respond_to do |format|
        format.html { redirect_to :back }
        format.js
      end
    else
      @user = User.find(params[:followee_id])
      respond_to do |format|
        format.html { redirect_to :back }
        format.js { render :action => 'unfollow_2' }
      end
    end
  end

end
