class RecipeIngredientSerializer < ActiveModel::Serializer
  attributes :quantity, :ingredient
	has_one :ingredient
   
	def ingredient
    return object.ingredient.name
  end

end
