class SessionsController < ApplicationController
   include ActionController::HttpAuthentication::Basic::ControllerMethods
   include ActionController::HttpAuthentication::Token::ControllerMethods
	def new
	end

	def create
    		if user = User.authenticate(params[:username], params[:password])
      			session[:current_user_id] = user.id
      			redirect_to root_url
    		end
  	end

	def destroy
		#complete this method
	end
end
