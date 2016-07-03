class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery except: [:transactions]
  
  def authenticate_admin_user!
    raise SecurityError unless current_user.is_admin 
  end

  rescue_from SecurityError do |exception|
    redirect_to root_path , flash: {notice: "Access Denied"}
  end

  def after_sign_in_path_for(resource)
    if resource.is_admin?
        admin_dashboard_path
    else
        root_path
    end
  end
end
