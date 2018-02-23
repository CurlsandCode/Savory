class RecipesController < ApplicationController
	before_action :set_recipe ,only: [:show,:edit,:update,:destroy]
		def index
		@recent_recipes = Recipe.recently_added_recipes
		if params[:user_id]
			@recipes = User.find(params[:user_id]).recipes
		else
			@recipes = Recipe.all.by_alphabet
			respond_to do |format|
				format.html {render :index}
				format.json {render json: @recipes}
			end
		end
	end
			def show
		@recipe = Recipe.find(params[:id])
		if current_user
			@comment = current_user.comments.build(recipe: @recipe)
		end
		respond_to do |format|
			format.html {render :show}
			format.json {render json: @recipe}
		end
	end
			def new
		if user_signed_in?
			@recipe = Recipe.new
					else 
			redirect_to  new_user_session_path
		end
	end
		def create
		@recipe = Recipe.create (recipe_params)
		if @recipe.save
			redirect_to recipe_path(@recipe) , notice: "Successfully created new recipe"
		else
						render 'new'
		end
	end
		def edit
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
		def upvote
		@recipe = Recipe.find(params[:id])
		@recipe.upvote_by current_user
		redirect_back fallback_location: root_path
	end
		def downvote
		@recipe = Recipe.find(params[:id])
		@recipe.downvote_by current_user
		redirect_back fallback_location: root_path
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