class Payment < ActiveRecord::Base
  belongs_to :order
  attr_accessible :type, :date, :summ, :order_id, :end, :start 
  self.inheritance_column = nil
end
