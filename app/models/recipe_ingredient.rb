class RecipeIngredient < ApplicationRecord
	belongs_to :recipe, optional: true
	belongs_to :ingredient, optional: true
	

end
