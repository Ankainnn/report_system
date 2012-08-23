class Schedule < ActiveRecord::Base
  belongs_to :office
  belongs_to :teacher
  belongs_to :course
  has_many :orders


  attr_accessor :name
  def name
  	self.course.name + " - " + self.teacher.name + " - " + self.office.name + " - " + self.day
  end
end
