class PostsController < ApplicationController
  def new
    #Viewで渡すためのインスタンス変数に空のModelオブジェクトを生成するための記述。Post.newをPostモデルに入れる。
    @post = Post.new
  end

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def create
    #post.newの作成データを@postという空のインスタンス変数に格納
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    #格納された@postの内容をデータベースに保存するための保存を実行
    if @post.save
      flash[:notice] = "success"
      #最初に@postにデータが格納されているためそのデータにリダイレクト
      redirect_to posts_path
    else
      flash.now[:alert] = "failed"
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def post_params
    params.require(:post).permit(:title, :image, :item, :address, :introduction)
  end
  
end

