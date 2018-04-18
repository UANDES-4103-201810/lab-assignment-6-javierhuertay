class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authorize
  protected
  def authorize
	unless User.find_by(id: session[:user_id])
		redirect_to login_url	
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
         	redirect_to login_url
	end
  end
  
  private

  def current_user
    	@_current_user ||= session[:current_user_id] &&
      	User.find_by(id: session[:current_user_id])
  end


end
