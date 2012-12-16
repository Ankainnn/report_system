class Payment < ActiveRecord::Base
  belongs_to :order
  belongs_to :course

  attr_accessible :type, :date, :summ, :order_id, :course, :schedule, :client, :hours, :office, :end, :start, :pay_from, :order_name, :pay_to

  validates :date, :summ, :order_id, :course, :schedule, :client, :hours, :office, :type, presence: true

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
