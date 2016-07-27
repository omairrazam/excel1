class Graph < ActiveRecord::Base
	has_one :dataset
	belongs_to :category
	has_many :adts
	has_many :graph_datums
end
