class ApplicationController < ActionController::Base
  helper_method :current_user, :log_in?
  def current_user
    User.first
  end

  def log_in?
    true
  end
end
