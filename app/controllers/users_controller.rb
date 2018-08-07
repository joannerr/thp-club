class UsersController < ApplicationController
  def new
  end

  def create
  	@user = User.new(
      first_name: params[:first_name], 
      last_name: params[:last_name], 
      email: params[:email], 
      password: params[:password], 
      password_confirmation: params[:password_confirmation]
      )
  	if @user.save
  		log_in @user
  		redirect_to root_path, flash: { success: "Bienvenue au club !" }
  	else
      flash.now[:danger] = "Des informations sont erronées. Veuillez réessayer."
      render 'new'
  	end
  end

  def secret_page
  	@tab_users = User.all
  end

end
