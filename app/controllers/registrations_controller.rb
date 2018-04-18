class RegistrationsController < ApplicationController
  

	def new
	    @user = User.new
	end

	def create
	    @user = User.new(user_params)
	    if @user.save
	    	redirect_to root_path
		flash[:notice] = "User has been created"
	    else 
		redirect_to sign_in_path
		flash[:notice] = "User hasn't been created"
    	    end
	end

	private

	def user_params
	    params.require(:registrations).permit(:name, :last_name, :email, :password, :phone)
	end
	
	def update_params
    	    params.permit(name: true, last_name: true, email: true, password:true , phone:true)
    	end	
    
end
