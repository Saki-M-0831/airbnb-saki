class ApplicationController < ActionController::Base
  before_action :require_login
  before_action :configure_permitted_parameters, if: :devise_controller?

  def require_login
    unless !current_user.nil?
      flash[:error] = "You must login to have the access to this section"

      redirect_to new_user_session_url 
    end
  end

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :phone, :description, :image])
  end
end
