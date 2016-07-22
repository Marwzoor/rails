class ShoutsController < ApplicationController
  before_filter :authenticate_user, :only => [:create]

  def create
  	@shout = Shout.new(:message => params[:message], :user_id => @current_user.id)

  	if @shout.save
  	  flash[:notice] = "Shout successfully posted"
  	  flash[:color] = "valid"
  	else
  	  flash[:notice] = "Form is invalid"
  	  flash[:color] = "invalid"
  	end

  	if params[:redirect_to]
  	  redirect_to(params[:redirect_to])
  	  return
  	end

  	redirect_to(:controller => 'sessions', :action => 'home')
  end

end
