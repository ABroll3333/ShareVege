class Public::PostsController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :update]
  before_action :ensure_guest_user, only: [:edit, :new]
  def new
    #Viewで渡すためのインスタンス変数に空のModelオブジェクトを生成するための記述。Post.newをPostモデルに入れる。
    @post = Post.new
  end

  def index
    @posts = Post.page(params[:page])

  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments
    @comment = Comment.new
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
    @post = Post.find(params[:id])
    unless @post.user.id == current_user.id
      redirect_to posts_path
    end
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to @post
    else
      render :'edit'
    end
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to '/posts'
  end

  private
  def post_params
    params.require(:post).permit(:title, :image, :item, :amount, :address, :introduction, :tag)
  end
  def is_matching_login_user
    if user_signed_in?
      post = Post.find(params[:id])
      unless post.user.id == current_user.id
        redirect_to post_path
      end
    else
      redirect_to root_path
    end
  end
  def ensure_guest_user
    if current_user.email == "guest@example.com"
      redirect_to posts_path, notice: "ゲストユーザーは新規投稿や投稿編集画面へ遷移できません"
    end
  end
end

