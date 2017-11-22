class RecipesController < ApplicationController
before_action :set_recipe ,only: [:show,:edit,:update,:destroy]
	
	def index
		if params[:user_id]
		 @recipes = User.find(params[:user_id]).recipes
		else
		 @recipes = Recipe.all.order("created_at DESC")
		end
	end
	def show
	end
	def new
		if user_signed_in?
		@recipe = Recipe.new
		5.times {@recipe.recipe_ingredients.build.build_ingredient}
		5.times  {@recipe.directions.build}
		else 
			redirect_to  new_user_session_path
	  end
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
     5.times { @recipe.recipe_ingredients.build.build_ingredient}
     5.times { @recipe.directions.build}
	end
	
	def update
         if @recipe.update(recipe_params)
           redirect_to @recipe, notice: "Recipe successfully updated."
         else
          render :edit
       end
	end
	def destroy
		@recipe.destroy
		redirect_to @recipe, notice: "Recipe successfully destroyed."
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