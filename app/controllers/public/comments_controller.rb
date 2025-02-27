class Public::CommentsController < ApplicationController
  before_action :authenticate_user!
  def create
    post = Post.find(params[:post_id])
    comment =  current_user.comments.new(comment_params)
    comment.post_id = post.id
    if comment.save
      redirect_to post_path(post)
    else
      flash[:alert] = 'ログインしてください'  # エラーメッセージを設定
      redirect_to new_user_session_path
    end
  end
  
  def destroy
      Comment.find(params[:id]).destroy
      redirect_to post_path(params[:post_id])
  end

  private

  def comment_params
    params.require(:comment).permit(:comment, :star)
  end
  
end
