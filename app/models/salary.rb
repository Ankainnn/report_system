class Salary < ActiveRecord::Base
  belongs_to :course
  belongs_to :teacher
  attr_accessible :type, :date, :summ, :course_id, :teacher_id, :month, :comment
  self.inheritance_column = nil
end
