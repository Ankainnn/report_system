class Teacher < ActiveRecord::Base
	has_and_belongs_to_many :courses
	has_many :orders
	has_many :schedules
	has_many :salaries

	def fio
    if self.try(:surname)
    	self.try(:name) + " " + self.try(:surname)
    else
    	self.try(:name)
    end
  end
end
