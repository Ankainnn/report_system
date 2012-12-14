# -*- encoding : utf-8 -*-
class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authenticate_user!
  before_filter :user_ban
  #before_filter :active_user

  def user_role
    current_user.role
  end

  def active_user
  	if current_user && current_user.active == 0 && current_user != User.first
  		#redirect_to new_user_session_path
  		redirect_to current_user
  		#sign_out(current_user)
  		#redirect_to new_user_session_path
  	end
  end

  def only_admin
   if user_role == "admin"
   else
     redirect_to clients_path, notice: "У вас нет прав для просмотра даного раздела, или редактирования информации"
   end
  end

  def only_admin_and_user
    if user_role == "admin" || user_role == "user"
    else
      redirect_to clients_path, notice: "У вас нет прав для просмотра даного раздела, или редактирования информации"
    end
  end

  def collect_c
    client_id = []
    Order.all.each do |order|
      client_id << order.client_id
    end
    uniq_client_id = client_id.uniq
    Client.where(id: uniq_client_id)
  end




  def user_ban
    user = current_user if current_user.object_id.present?
    if user
      if user.ban == "true"
        render text: "Вы заблокированы. Пожалуйста свяжитесь с администраций сайта для выяснения причины блокировки, и возможности разблокировать учетную запись"
      else

      end
    end
  end


end
