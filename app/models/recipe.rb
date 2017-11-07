class Recipe < ApplicationRecord
	belongs_to :user , foreign_key :"user_id"
	has_many :directions
	has_many :recipe_ingredients
	has_many :ingredients,through: :recipe_ingredients
	
end
