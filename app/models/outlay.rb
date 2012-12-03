class Outlay < ActiveRecord::Base
  belongs_to :cost
  attr_accessible :type, :date, :summ, :cost_id, :person, :name, :comment

  validates :date, :sum, :cost_id, :type, presence: true

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
