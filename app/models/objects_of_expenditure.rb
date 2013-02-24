class ObjectsOfExpenditure < ActiveRecord::Base
  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << column_names
      each do |obj_of_expend|
        csv << obj_of_expend.attributes.values_at(*column_names)
      end
    end
  end
end
