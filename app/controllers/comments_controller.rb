class CommentsController < ApplicationController
		before_action :set_comment 
		
	def new
		super
	end
		

		def create
			@recipe = Recipe.find(params[:recipe_id])
			@comment = @recipe.comments.new (comment_params)
			@comment.user = current_user
			if @comment.save
				redirect_to recipe_path(@recipe) , notice: "Successfully created new comment"
			else
			redirect_to recipe_path(@recipe) , notice: "Please try again"
			end
		end
		
		
		private
	
		def set_comment
			@comment = Comment.find(params[:id])
		end
		
	 	def comment_params
    	params.require(:comment).permit(:recipe_id, :body, :user_id)
		end
	
end