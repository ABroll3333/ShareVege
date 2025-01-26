class ApplicationController < ActionController::Base
  #deviseの機能が使用される前にconfigure_permitted_parametersのメソッドが使用される
  before_action :configure_permitted_parameters, if: :devise_controller?

  #after_sign_in_pathは初期設定でroot_pathになっている。resourceという引数にはログインを実行したモデルのデータが格納されている
  def after_sign_in_path_for(resources)
    posts_path
  end


  def after_sign_out_path_for(resources)
    homes_about_path
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :postal_code, :address, :phone_number])
  end
end
