class Admin::CommentsController < ApplicationController
  before_action :authenticate_admin!
  layout 'admin'

  def index
    @post = Post.find(params[:id])
    @comments = @post.comments.all
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to admin_post_comments_path, notice: 'コメントを削除しました'
  end

  private

  def comment_params
    params.require(:comment).permit(:comment, :star)
  end

end
