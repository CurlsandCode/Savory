class CommentsController < ApplicationController
  before_action :set_recipe

  def create
    @comment = current_user.comments.create(comment_params)
    @comment.recipe = @recipe
    if @comment.save
    render json: @comment,status: 201
		else 
			render json: {errors: @comment.errors.full_messages}, status: 400
		end
  end



  private

  def set_recipe
    @recipe = Recipe.find(params[:recipe_id])
  end

  def comment_params
    params.require(:comment).permit(:body)
  end
end