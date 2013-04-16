class User < ActiveRecord::Base
  belongs_to :office
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :user_nick, :role, :user_ban, :name, :surname, :position, :phone, :office_id
  #validates :phone, :surname, :name, :position, :role, :office, presence: true

  def fio
      "#{self.try(:name)}	#{self.try(:surname)}"
  end

  
end
