class Direction < ApplicationRecord
	belongs_to :recipe, option :true
end
