class RecipeIngredient < ApplicationRecord
	belongs_to :recipe, option :true
	belongs_to :ingredient
end
