class ShoutsController < ApplicationController
  before_filter :authenticate_user, :only => [:create]

  def create
  	@shout = Shout.new(shout_params)
    @shout.user_id = @current_user.id

    respond_to do |format|
    	if @shout.save
    	  format.json
    	else
    	  format.json { render json: @shout.errors, status: :unprocessable_entity }
    	end
    end
  end

  private

  def shout_params
    params.require(:shout).permit(:message, )
  end

end
