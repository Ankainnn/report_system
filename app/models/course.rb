class Course < ActiveRecord::Base
	has_and_belongs_to_many :clients
	has_and_belongs_to_many :teachers
	has_many :salaries
	has_many :schedules
	has_many :orders


  attr_accessor :name

  validates :direction, :subject, presence:true
	def name
    self.direction + " / " + self.subject
  end

  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << column_names
      each do |course|
        csv << course.attributes.values_at(*column_names)
      end
    end
  end

end
