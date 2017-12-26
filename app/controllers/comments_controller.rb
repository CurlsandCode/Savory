class CommentsController < ApplicationController
  before_action :set_recipe

  def create
    @comment = current_user.comments.create(comment_params)
    @comment.recipe = @recipe
    @comment.save
    redirect_to recipe_path(@recipe) , notice: "Successfully created new comment"
  end



  private

  def set_recipe
    @recipe = Recipe.find(params[:recipe_id])
  end

  def comment_params
    params.require(:comment).permit(:body)
  end
end