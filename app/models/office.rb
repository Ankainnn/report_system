class Office < ActiveRecord::Base
	has_many :clients
	has_many :orders
	has_many :schedules

  validates :name, :address, presence:true

  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << column_names
      each do |office|
        csv << office.attributes.values_at(*column_names)
      end
    end
  end
end
