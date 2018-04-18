class SessionsController < ApplicationController
   
	def new
	end

	 def create
    		user = User.find_by(email: params[:email])
    		if user and user.authenticate(params[:password])
      			session[:user_id] = user.id
      			redirect_to root_path
    		else
    		# If user's login doesn't work, send them back to the login form.
      			redirect_to sign_in_path
    end
  end

	def destroy
		#complete this method
	end

	private

end
