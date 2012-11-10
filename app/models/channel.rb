class Channel < ActiveRecord::Base
	has_many :clients
end
