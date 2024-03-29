class ApplicationController < ActionController::Base
  protect_from_forgery
  
before_filter :current_user
helper_method :current_user
rescue_from CanCan::AccessDenied do|ex|
  flash[:error] = 'Access Denied.'
  redirect_to tasklists_path
end


private

def current_user
  @current_user ||= User.find_by_id(session[:user_id]) if session[:user_id]
end

def confirm_logged_in
	unless session[:user_id]
		flash[:notice] = 'Please Login First'
		redirect_to :controller => 'sessions', :action => 'new'
		return false
	else
		return true
  end
end


end
