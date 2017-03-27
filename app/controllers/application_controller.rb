class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :configure_permitted_parameters, if: :devise_controller?
  
  protected
  # Strong paramters with devise to store updated values
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |user_params|
      user_params.permit({roles: [] }, :name, :email, :password, :password_confirmation, :administrator, :faculty)
    end
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :administrator, :faculty])
  end
end
