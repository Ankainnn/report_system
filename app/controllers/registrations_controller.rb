class RegistrationsController < Devise::RegistrationsController
	before_filter :authenticate_user!, :only => [:change_user, :list]

  def change_user(user)
    user.active = 1

    if user.save
      format.html { redirect_to root_url, notice: 'User was successfully updated.' }
      
    else
      format.html { render action: "list" }
      
    end
  end

  def list
    @users = User.all
  end
end
