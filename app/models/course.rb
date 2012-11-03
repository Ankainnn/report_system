class Course < ActiveRecord::Base
	has_and_belongs_to_many :clients
	has_and_belongs_to_many :teachers
	has_many :salaries
	has_many :schedules
	has_many :orders

  attr_accessor :name

	def name
    self.direction + " / " + self.subject
	end

end
