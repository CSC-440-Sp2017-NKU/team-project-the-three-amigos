class RegistrationsController < Devise::RegistrationsController
  # Used to override already logged on error from devise when adding a user to the system
  before_action :authenticate_user!, :redirect_unless_admin,  only: [:new, :create]
  skip_before_action :require_no_authentication

  private
  def redirect_unless_admin
    unless current_user.administrator
      flash[:error] = "Only admins can do that"
      redirect_to root_path
    end
  end

  def sign_up(resource_name, resource)
    true
  end
end