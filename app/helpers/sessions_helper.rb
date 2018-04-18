module SessionsHelper

	def logged_in?
       		!current_user.nil?
  	end
	
  	def is_user_logged_in?
		unless logged_in?
        	 	flash[:danger] = "Please log in."
        	 	redirect_to login_url
		end
  	end
end
