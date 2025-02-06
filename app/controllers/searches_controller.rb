class SearchesController < ApplicationController
  before_action :authenticate_user!

  def search
    # 検索モデルから情報を受け取っている
    @range = params[:range]

    if @range == "User"
      @users = User.looks(params[:search], params[:word])
    else
      @posts = Post.looks(params[:search], params[:word])
    end
  end
end
