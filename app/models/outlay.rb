class Outlay < ActiveRecord::Base
  belongs_to :cost
  belongs_to :objects_of_expenditure
  attr_accessible :type, :date, :summ, :cost_id, :objects_of_expenditure_id, :person, :name, :comment

  validates :date, :summ, :cost_id, :type, :objects_of_expenditure_id, presence: true

  self.inheritance_column = nil

  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << column_names
      each do |outlay|
        csv << outlay.attributes.values_at(*column_names)
      end
    end
  end

end
