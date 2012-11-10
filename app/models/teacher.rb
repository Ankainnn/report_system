# -*- encoding : utf-8 -*-
class Teacher < ActiveRecord::Base
	has_and_belongs_to_many :courses
	has_many :orders
	has_many :schedules
	has_many :salaries

  validates_format_of :email,
                      :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i,
                      :message => 'E-mail адресс введен не коректно'

	def fio
    if self.try(:surname)
    	self.try(:name) + " " + self.try(:surname)
    else
    	self.try(:name)
    end
  end
end
