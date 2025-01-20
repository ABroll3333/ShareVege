class PostsController < ApplicationController
  def new
    #Viewで渡すためのインスタンス変数に空のModelオブジェクトを生成するための記述。Post.newをPostモデルに入れる。
    @post = Post.new
  end

  def index
  end

  def show
  end

  def create
    #post.newの作成データを@postという空のインスタンス変数に格納
    @post = Post.new(post_params)
    #格納された@postの内容をデータベースに保存するための保存を実行
    @post.save
    #最初に@postにデータが格納されているためそのデータにリダイレクト
    redirect_to post_path(@post)
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def post_params
    params.require(:post).permit(:title, :introduction)
  end
  
end

