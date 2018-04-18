class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def index

  end

  def current_user
	@_current_user ||= session[:current_user_id] &&
      	User.find_by(id: session[:current_user_id])
  end

  def logged_in?
       !current_user.nil?
  end
	
  def is_user_logged_in?
	unless logged_in?
         	flash[:danger] = "Please log in."
         	redirect_to users_path
	end
  end
  
  private

  def current_user
    	@_current_user ||= session[:current_user_id] &&
      	User.find_by(id: session[:current_user_id])
  end


end
