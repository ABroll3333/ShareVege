class ApplicationController < ActionController::Base
  #deviseの機能が使用される前にconfigure_permitted_parametersのメソッドが使用される
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :postal_code, :address, :phone_number])
  end
end
