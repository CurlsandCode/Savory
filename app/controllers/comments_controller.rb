class CommentsController < ApplicationController
  before_action :set_recipe

  def create
    @comment = current_user.comments.create(comment_params)
    @comment.recipe = @recipe
     respond_to do |format|
      if @comment.save
        format.html { redirect_to @recipe, notice: 'Comment was successfully created.' }
        format.json { render json: @comment, status: 201}
      else
        format.html { redirect_to @recipe, notice: "You can't leave the comment box blank.Please try again!" }
        format.json { render json: @comment.errors, status:400 }
      end
    end
  end


  def destroy
    @comment = @recipe.comments.find(params[:id])
    @comment.destroy
    respond_to do |format|
      format.html { redirect_back fallback_location: root_path, notice: 'Comment was successfully destroyed.' }
      format.json { head :no_content }
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