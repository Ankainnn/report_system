class User < ActiveRecord::Base
  belongs_to :office
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :user_nick, :role, :user_ban, :name, :surname, :position, :phone, :office_id

  def activate
  	self.active = 1
  end

  def act
  	self.active
  end

  def fio
      self.try(:name)  + " " +  	self.try(:surname)
  end

  
end
