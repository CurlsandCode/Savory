class CommentsController < ApplicationController
		before_action :set_comment 
		

		def create
			@comment = @current_user.comment.create (comment_params)
			@comment.recipe = @recipe
			if @comment.save
				redirect_to recipe_path(@recipe) , notice: "Successfully created new comment"
			else
			redirect_to recipe_path(@recipe) , notice: "Please try again"
			end
		end
		
		
		private
	
		def set_comment
			@recipe = Recipe.find(params[:id])
		end
		
	 	def comment_params
    	params.require(:comment).permit(:body)
		end
	
end