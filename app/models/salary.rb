class Salary < ActiveRecord::Base
  belongs_to :course
  belongs_to :schedule
  belongs_to :teacher

  validates :date, :summ, :teacher_id, :course_id, :schedule_id, :pay_from, :pay_to, :type, presence: true
  self.inheritance_column = nil

  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << column_names
      each do |salary|
        csv << salary.attributes.values_at(*column_names)
      end
    end
  end

end
