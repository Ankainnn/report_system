class Office < ActiveRecord::Base
	has_many :clients
	has_many :orders
	has_many :schedules
end
