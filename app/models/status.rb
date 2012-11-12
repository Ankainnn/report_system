class Status < ActiveRecord::Base
	has_many :clients

  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << column_names
      each do |status|
        csv << status.attributes.values_at(*column_names)
      end
    end
  end

end
