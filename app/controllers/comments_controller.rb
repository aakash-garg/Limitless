class CommentsController < ApplicationController
  # before_action :set_comment, only: [:update, :destroy]


  # POST /comments
  # POST /comments.json
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(params[:comment].permit(:content))
    @comment.user_id = current_user.id
    @comment.save
    # redirect_to post_path(@post)
    respond_to do |format|
      format.html {
        redirect_to @post
        flash[:success] = 'Comment posted.'
      }
      format.js{
        flash[:success] = 'Comment posted.'
      }
    end
  end


  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    respond_to do |format|
      format.html{
        redirect_to post_path(@post)
        flash[:success] = 'Comment deleted.'
      }
      format.js{
        flash[:success] = 'Comment deleted.'
      }
    end
  end

  def upvote
    @comment = Comment.find(params[:id])
    @comment.upvote_by current_user
    respond_to do |format|
      format.html {
        redirect_to :back
      }
      format.js   { render :layout => false }
    end
  end

  def downvote
    @comment = Comment.find(params[:id])
    @comment.downvote_by current_user
    respond_to do |format|
      format.html {
        redirect_to :back
      }
      format.js   { render :layout => false }
    end
  end

  private
    def comment_params
      params.require(:comment).permit(:content)
    end
end
