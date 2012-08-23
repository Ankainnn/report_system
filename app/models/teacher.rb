class Teacher < ActiveRecord::Base
	has_and_belongs_to_many :courses
	has_many :orders
	has_many :schedules
	has_many :salaries
end
