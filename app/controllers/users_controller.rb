# -*- encoding : utf-8 -*-
class UsersController < ApplicationController

	before_filter :authenticate_user!
	before_filter :active_user, :except => [:show]
  def change_user
  	user = User.find(params[:id])
    user.active = 1
    if user.save
    	logger.debug "=============================="
      redirect_to root_url
      #format.json { head :no_content }
    else
      #format.html { render action: "list" }
      render action: "list"
      #format.json { head :no_content }
    end
  end

  def list
    @users = User.all
  end
end