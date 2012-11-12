class Salary < ActiveRecord::Base
  belongs_to :course
  belongs_to :schedule
  belongs_to :teacher
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
