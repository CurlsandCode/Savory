class RecipeSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :image
	has_many :comments
	has_many :directions
	has_many :recipe_ingredients
	has_many :votes_for
	belongs_to :user
end
