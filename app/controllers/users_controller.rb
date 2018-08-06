class UsersController < ApplicationController
  def new
  end

  def create
  	puts "-"*50
  	mon_user = User.new(first_name: params[:first_name], last_name: params[:last_name], email: params[:email])
  	if mon_user.save
  		puts "Mon user à été enregistré"
  		log_in(mon_user)
  		redirect_to root_path
  	else
  		puts "Mon user a un souci :("
  	end
  end

  def secret_page
  	@tab_users = User.all
  end

end
