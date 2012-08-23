class Client < ActiveRecord::Base
  belongs_to :status
  belongs_to :resource
  belongs_to :channel
  belongs_to :manager
  belongs_to :office
  has_and_belongs_to_many :courses
  has_many :orders
  
end
