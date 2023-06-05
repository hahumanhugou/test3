class ApplicationController < ActionController::Base
  before_action :authenticate_user!, except: [:top,:about]
  before_action :configure_permitted_parameters, if: :devise_controller?


  def after_sign_in_path_for(resource)
    flash[:notice] = "Account was successfully created."
    user_path(@user.id)

  end
  def after_sign_out_path_for(resource)
    flash[:notice] = "You were successfully logout."
    root_path

  end
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
  end
end