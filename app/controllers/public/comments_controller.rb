class Public::CommentsController < ApplicationController
  before_action :authenticate_user!

  def new
    @comment = Comment.new
  end

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
  
  def edit
    @comment = Comment.find(params[:id])
    @post = @comment.post
  end
  
  def update
    @comment = Comment.find(params[:id])
    @post = @comment.post
    if @comment.update(comment_params)
      flash[:notice] = "success"
      redirect_to post_path(@post)
    else
      flash.now[:alert] = "failed"
      render :edit
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
