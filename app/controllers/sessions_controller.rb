class SessionsController < ApplicationController
  before_filter :authenticate_user, :only => [:home, :profile, :setting]
  before_filter :save_login_state, :only => [:login, :login_attempt]

  def login
  end

  def login_attempt
  	authorized_user = User.authenticate(params[:username_or_email], params[:login_password])

  	if authorized_user
  	  session[:user_id] = authorized_user.id
  	  flash[:notice] = "Wow Welcome again, you logged in as #{authorized_user.username}"
  	  redirect_to(:action => "home")
  	else
  	  flash[:notice] = "Invalid username or password"
  	  flash[:color] = "danger"
  	  render "login"
  	end
  end

  def logout
    session[:user_id] = nil
    redirect_to(:action => 'login')
  end

  def home
  	@shouts = Shout.order(created_at: :desc)
  end

  def profile
  end

  def setting
  end
end