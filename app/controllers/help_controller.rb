class HelpController < ApplicationController
  def index
  end

  def admin_add_user
    @user = User.new
  end

  def create
    User.create(params[:user])
    redirect_to clients_path
  end
end
