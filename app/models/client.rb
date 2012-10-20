class Client < ActiveRecord::Base
  belongs_to :status
  belongs_to :resource
  belongs_to :channel
  belongs_to :manager
  belongs_to :office
  has_and_belongs_to_many :courses
  has_many :orders
  
  def fio
    if self.try(:surname)
    	self.try(:name) + " " + self.try(:surname)
    else
    	self.try(:name)
    end
  end

end
