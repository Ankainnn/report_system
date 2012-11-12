class Order < ActiveRecord::Base
  belongs_to :client
  belongs_to :course
  belongs_to :teacher
  belongs_to :schedule
  belongs_to :office # may be we should make this relations through the schedule
  has_many :payments

  attr_accessor :name
  def name
  	self.id
  end

  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << column_names
      each do |order|
        csv << order.attributes.values_at(*column_names)
      end
    end
  end
end
