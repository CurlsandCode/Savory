class RecipesController < ApplicationController
before_action :set_recipe ,only: [:show,:edit,:update,:destroy]
	
	def index
		@recipes = Recipe.all
	end
	def show
	end
	def new
		@recipe = Recipe.new
		5.times {@recipe.recipe_ingredients.build.build_ingredient}
		5.times  {@recipe.directions.build}
	end
	def create
		@recipe = Recipe.create (recipe_params)
		if @recipe.save
		redirect_to @recipe , notice: "Successfully created new recipe"
		else
			render 'new'
		end
	end
	def edit
	end
	
	def update
        @recipe.update(recipe_params)
	    redirect_to recipes_path (@recipe)
	end
	def destroy
		@recipe.destroy
	end
	
	private
	
	def set_recipe
		@recipe = Recipe.find(params[:id])
	end
	 def recipe_params
    params.require(:recipe).permit(
      :name,
      :description,
      :image,
      :user_id,
      directions_attributes: [:id, :step],
      recipe_ingredients_attributes: [
        :id,
        :quantity,
        :recipe_id,
        :ingredient_id,
        ingredient_attributes: [:id, :name]])
      end
	
end