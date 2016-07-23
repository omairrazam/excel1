class Graph <  ActiveRecord::Base
	belongs_to :category
	has_many :adts
	has_one :chart
end
