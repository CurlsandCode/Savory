class RecipeIngredient < ApplicationRecord
	belongs_to :recipe, optional: true
	belongs_to :ingredient, optional: true
    accepts_nested_attributes_for :ingredient, :reject_if => proc { |attr| attr[:name].blank?}
end