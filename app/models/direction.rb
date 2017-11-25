class Direction < ApplicationRecord
belongs_to :recipe, optional: true
validates :step, presence: true	
end
