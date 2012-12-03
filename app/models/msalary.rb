class Msalary < ActiveRecord::Base
  belongs_to :manager
  attr_accessible :type, :date, :summ, :manager_id, :end, :start, :comment, :pay_from, :pay_to

  validates :date, :summ, :manager_id, :pay_from, :pay_to, :type, presence: true
  self.inheritance_column = nil

  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << column_names
      each do |msalary|
        csv << msalary.attributes.values_at(*column_names)
      end
    end
  end
end
