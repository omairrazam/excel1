class Graph < ActiveRecord::Base
	has_one :dataset
	belongs_to :category
	has_many :adts
end
