class IngredientsController < ApplicationController
  def index
    @ingredients = Ingredient.all
  end

    def new
    if params[:recipe_id]
      @recipe = Recipe.find(params[:recipe_id])
      @recipe_ingredient = @recipe.recipe_ingredients.build
      @ingredient = @crecipe_ingredient.build_ingredient
    else
      @ingredient = Ingredient.new
    end
	end
end