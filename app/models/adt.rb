class Adt < ActiveRecord::Base
	has_one :dataset
	belongs_to :graph
end
