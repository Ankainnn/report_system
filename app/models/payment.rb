class Payment < ActiveRecord::Base
  belongs_to :order
  attr_accessible :type, :date, :summ, :order_id, :end, :start 
  self.inheritance_column = nil
  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << column_names
      each do |payment|
        csv << payment.attributes.values_at(*column_names)
      end
    end
  end
end
