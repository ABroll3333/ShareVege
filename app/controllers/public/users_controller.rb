class Public::UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show, :edit, :update]
  before_action :ensure_guest_user, only: [:edit,]
  def show
    @user = User.find(params[:id])
    @posts = @user.posts.page(params[:page])
  end



  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "success"
      redirect_to @user
    else
      flash.now[:alert] = "failed"
      render :'edit'
    end
  end

  def destroy
    @user = User.find(params[:id]) 
    @user.destroy
    flash[:notice] = 'ユーザーを削除しました。'
    redirect_to new_user_registration_path
  end


  private
  
  def user_params
    params.require(:user).permit(:name, :email, :postal_code, :address, :phone_number)
  end
  def is_matching_login_user
    user = User.find(params[:id])
    unless user.id == current_user.id 
      redirect_to user_path(current_user)
    end
  end
  def ensure_guest_user
    @user = User.find(params[:id])
    if @user.email == "guest@example.com"
      redirect_to user_path(current_user) , notice: "ゲストユーザーはプロフィール編集画面へ遷移できません"
    end
  end
end
