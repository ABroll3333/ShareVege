class Public::HomesController < ApplicationController
  def top
  end

  def about
  end

  def index
    @posts = Post.all
    render "posts/index"  # ポストコントローラーのindexアクションを表示
  end
end
