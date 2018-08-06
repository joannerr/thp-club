class SessionsController < ApplicationController
  def login
  end

  def create
  	@email = params[:session][:email]
  	mon_user = User.find_by(email: @email.downcase)

  	if mon_user && params[:session][:secret_pass] == "test"
  		log_in(mon_user)
  		redirect_to root_path
  	else
  		flash.now[:danger] = 'Invalid email/password combination'
      render '/'
  	end
  end

  def destroy
  	log_out
  	redirect_to root_path
  end


end
