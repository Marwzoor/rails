class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  protected

  def authenticate_user
  	if session[:user_id]
  	  # Set current user object to @current_user object variable
  	  @current_user = User.find(session[:user_id])
  	else
  	  redirect_to(:controller => 'sessions', :action => 'login')
  	  return false
  	end
  end

  def save_login_state
  	if session[:user_id]
  	  redirect_to(:controller => 'sessions', :action => 'home')
  	  return false
  	else
  	  return true
  	end
  end
end
