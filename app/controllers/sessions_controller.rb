class SessionsController < ApplicationController
  
  def new
  end 

  def create
  	@email = params[:session][:email]
  	@user = User.find_by(email: @email.downcase)

  	if @user && params[:session][:password]
  		log_in @user
  		redirect_to root_path
  	else
  		flash.now[:danger] = "Indentifiants incorrects. Veuillez réessayer."
      render 'new'
  	end
  end

  def destroy
  	log_out 
  	redirect_to root_path
  end


end
