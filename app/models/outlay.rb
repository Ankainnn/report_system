class Outlay < ActiveRecord::Base
  belongs_to :cost
  attr_accessible :type, :date, :summ, :cost_id, :person, :name, :comment
  self.inheritance_column = nil
end
