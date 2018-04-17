class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include ActionController::HttpAuthentication::Basic::ControllerMethods
  include ActionController::HttpAuthentication::Token::ControllerMethods

  def index

  end

  def current_user
	@_current_user ||= session[:current_user_id] &&
      	User.find_by(id: session[:current_user_id])
  end

  def is_user_logged_in?
	!!current_user
  end


end
