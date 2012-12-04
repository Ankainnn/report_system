class Schedule < ActiveRecord::Base
  belongs_to :office
  belongs_to :teacher
  belongs_to :course
  has_many :orders
  has_many :salaries

  validates :day, :time, :office_id, :course_id, :hours, presence:true


  attr_accessor :name, :graphic
  def name
  	"#{self.course.try(:name)} - #{self.teacher.try(:name)} - #{self.office.try(:name)} - #{self.day}"
  end

  def graphic
    day + " / " + time
  end

  def fio
    self.name + " " + self.surname
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
