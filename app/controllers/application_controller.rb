class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authenticate_user!
  #before_filter :active_user

  def active_user
  	if current_user && current_user.active == 0 && current_user != User.first
  		#redirect_to new_user_session_path
  		redirect_to current_user
  		#sign_out(current_user)
  		#redirect_to new_user_session_path
  	end
  end
end
