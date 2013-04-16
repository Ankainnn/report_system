class RegistrationsController < Devise::RegistrationsController

  def change_user(user)
    user.active = 1

    if user.save
      format.html { redirect_to root_url, notice: 'User was successfully updated.' }
      
    else
      format.html { render action: "list" }
      
    end
  end

  def list
    @users = User.order(:created_at).reverse_order
  end
end
