class SessionsController < ApplicationController
	def new
	end

	def create
		@user = User.find_by(email: params[:session][:email])
		if @user
			if @user.password == params[:session][:pasword]
		  		session[:user] = @user
				flash[:notice] = "Log in sucesfully" 
			 	cookies.permanent.signed[:user_id] = @user.id
				redirect_to users_path
		else
		  redirect_to registrations_path
		  flash[:danger] = "Log in unsucsfully"
		end
	end

	def destroy	
	    User.find(session[:user_id]).destroy      
	    session[:user_id] = nil         
	    redirect_to registrations_path
	    flash[:danger] = "User destroyed!!" 
  	end
end  
end
