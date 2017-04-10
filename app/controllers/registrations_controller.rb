class RegistrationsController < Devise::RegistrationsController
  # Used to override already logged on error from devise when adding a user to the system
  prepend_before_action :check_captcha, only: [:create] # Change this to be any actions you want to protect.
  before_action :authenticate_user!, :redirect_unless_admin,  only: [:new, :create]
  skip_before_action :require_no_authentication

  def check_captcha
    unless verify_recaptcha
      self.resource = resource_class.new sign_up_params
      respond_with_navigational(resource) { render :new }
    end 
  end

  private
  def redirect_unless_admin
    unless current_user.administrator?
      flash[:error] = "Only admins can do that"
      redirect_to root_path
    end
  end

  def sign_up(resource_name, resource)
    true
  end
  
  def after_sign_up_path_for(resource)
    return users_path
  end
  
end