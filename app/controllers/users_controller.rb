class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @posts = @user.posts.page(params[:page])
  end



  def edit
    @user = User.find(params[:id])
  end

  def update
  end

  def destroy
    @user = User.find(params[:id]) 
    @user.destroy
    flash[:notice] = 'ユーザーを削除しました。'
    redirect_to :new_user_registration_path
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
  
end
