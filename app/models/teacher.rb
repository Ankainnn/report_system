# -*- encoding : utf-8 -*-
class Teacher < ActiveRecord::Base
	has_and_belongs_to_many :courses
	has_many :orders
	has_many :schedules
	has_many :salaries

  validate :has_courses?



  validates :name, :surname, :phone, :courses, presence:true

  validates :email,
            :format => {:with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i},
            :allow_blank => true



  def has_courses?
    errors[:base] << "Поле 'курс' не может быть пустым" if self.courses.blank?
  end

  def fio
    "#{self.try(:name)} #{self.try(:surname)}"
  end

  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << column_names
      each do |teacher|
        csv << teacher.attributes.values_at(*column_names)
      end
    end
  end
end
