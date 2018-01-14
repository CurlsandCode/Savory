class UsersController < ApplicationController
 skip_before_action :verify_authenticity_token
	def show
		binding.pry
		session[:init] = true
   @user = current_user
		@recipes = @user.recipes
    respond_to do |f|
      f.html { render :show}
      f.json { render json:  @user}
    end
  end
	
end