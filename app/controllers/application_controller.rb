# -*- encoding : utf-8 -*-
class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authenticate_user!
  before_filter :user_ban
  #before_filter :active_user

  def active_user
  	if current_user && current_user.active == 0 && current_user != User.first
  		#redirect_to new_user_session_path
  		redirect_to current_user
  		#sign_out(current_user)
  		#redirect_to new_user_session_path
  	end
  end

  def only_admin
   if current_user.role == "admin"
   else
     render text: "У вас нет прав для просмотра даного раздела, или редактирования информации"
     end
  end

  def user_ban
    user = current_user if current_user.object_id.present?
    if user
      if user.ban == "true"
        render text: "Вы заблокирован. Пожалуйста свяжитесь с администраций сайта для выяснения причины блокировки, и возможности разблокировать учетную запись"
      else

      end
    end


  end


end
