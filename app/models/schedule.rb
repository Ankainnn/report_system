class Schedule < ActiveRecord::Base
  belongs_to :office
  belongs_to :teacher
  belongs_to :course
  has_many :orders
  has_many :salaries


  attr_accessor :name, :graphic
  def name
  	self.course.name + " - " + self.teacher.name + " - " + self.office.name + " - " + self.day
  end

  def graphic
    day + " / " + time
  end

  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << column_names
      each do |schedule|
        csv << schedule.attributes.values_at(*column_names)
      end
    end
  end
end
