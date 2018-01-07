class UsersController < ApplicationController
 
	def show
   @user = User.find(params[:id])
		@recipes = @user.recipes
    respond_to do |f|
      f.html { render :show}
      f.json { render json:  @user}
    end
  end
	
end