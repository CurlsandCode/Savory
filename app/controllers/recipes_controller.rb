class RecipesController < ApplicationController
before_action :set_recipe ,only: [:show,:edit,:update,:destroy]
	def index
		@recipes = Recipe.all
	end
	def show
	end
	def new
		@recipe = Recipe.new
	end
	def create
		@recipe = Recipe.new (recipe_params)
		@recipe.save
		redirect_to recipe_path (@recipe)
		end
	
	def edit
	end
	
	def update
        @recipe.update(recipe_params)
	    redirect_to recipe_path (@recipe)
	end
	
	private
	
	def set_recipe
		@recipe = Recipe.find(params[:id])
	end
	def recipe_params
		params.require(:recipe).permit(:name, :description)
	end
	
end
