class Salary < ActiveRecord::Base
  belongs_to :course
  belongs_to :schedule
  belongs_to :teacher
  attr_accessible :type, :date, :summ, :course_id, :teacher_id, :end, :start, :comment
  self.inheritance_column = nil
end
