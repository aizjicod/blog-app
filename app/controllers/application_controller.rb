class ApplicationController < ActionController::Base
  helper_method :log_in?
  protect_from_forgery with: :exception

  before_action :update_allowed_parameters, if: :devise_controller?
  def log_in?
    false
  end

  protected

  def update_allowed_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :bio, :photo, :email, :password)}
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name, :bio, :photo, :email, :password, :current_password)}
  end
end
