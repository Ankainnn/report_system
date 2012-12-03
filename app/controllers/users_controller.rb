# -*- encoding : utf-8 -*-
class UsersController < ApplicationController

	#before_filter :authenticate_user!
	before_filter :active_user, :except => [:show]
  before_filter  :only_admin
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

  def new
    @user = User.new
  end

  def create
    User.create(params[:user])
    redirect_to list_users_path
  end


  def edit
    @user = User.find(params[:id])
  end


  def update
    @user = User.find(params[:id])
    @user.update_attributes(params[:user])
    redirect_to list_users_path
  end

  def destroy
    @user= User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to list_users_path }
      format.json { head :no_content }
    end
  end

  def ban
    @user = User.find(params[:id])
    if params[:ban] == "true"
      @user.update_attribute(:ban, "true")
    else
      @user.update_attribute(:ban, "false")
    end
    redirect_to list_users_path
  end
end