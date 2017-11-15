class RecipesController < ApplicationController
before_action :set_recipe ,only: [:show,:edit,:update,:destroy]
	
	def index
		@recipes = Recipe.all
	end
	def show
	end
	def new
		@recipe = Recipe.new
		10.times {@recipe.recipe_ingredients.build.build_ingredient}
		10.times  {@recipe.directions.build}
	end
	def create
		@recipe = current_user.recipes.build (recipe_params)
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
		params.require(:recipe).permit(:name, :description, :image, recipe_ingredients_attributes:[:quantity, ingredients_attributes:[:name]], directions_attributes:[:step])
	end
	
end
