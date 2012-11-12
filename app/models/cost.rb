class Cost < ActiveRecord::Base
	has_many :outpays

  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << column_names
      each do |cost|
        csv << cost.attributes.values_at(*column_names)
      end
    end
  end
end
