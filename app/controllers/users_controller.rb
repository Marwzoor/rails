class UsersController < ApplicationController
  before_filter :authenticate_user, :only => [:show]
  before_filter :save_login_state, :only => [:new, :create]

  def new
  	@user = User.new
  end
  
  def create
  	@user = User.new(user_params)
  	if @user.save
  	  flash[:notice] = "You signed up successfully"
  	  flash[:color] = "valid"
      session[:user_id] = @user.id
      redirect_to(:action => "home", :controller => "sessions")
      return
  	else
  	  flash[:notice] = "Form is invalid"
  	  flash[:color] = "invalid"
  	end
  	render "new"
  end

  def show
    @user = User.find_by_username(params[:username])

    if @user.id == @current_user.id
      redirect_back(fallback_location: root_path)
    end
  end

  private

  def user_params
  	params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end

end