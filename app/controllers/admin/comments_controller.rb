class Admin::CommentsController < ApplicationController
  before_action :authenticate_admin!
  layout 'admin'

  def index
    @comments = Comment.all
    @users = User.all
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to admin_comments_path, notice: 'コメントを削除しました'
  end

  private

  def comment_params
    params.require(:comment).permit(:comment, :star)
  end

end
