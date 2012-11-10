class Msalary < ActiveRecord::Base
  belongs_to :manager
  attr_accessible :type, :date, :summ, :manager_id, :end, :start, :comment
  self.inheritance_column = nil
end
