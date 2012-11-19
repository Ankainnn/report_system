class Channel < ActiveRecord::Base
	has_many :clients
  validates :name, presence:true

  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << column_names
      each do |channel|
        csv << channel.attributes.values_at(*column_names)
      end
    end
  end
end
