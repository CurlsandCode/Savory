class RecipeSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :image
	has_many :comments
	has_many :directions
	has_many :recipe_ingredients
	belongs_to :user
end
