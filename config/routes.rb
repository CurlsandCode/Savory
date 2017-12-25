Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
   
  resources :comments
	  resources :recipes do
      member do
          put "like",    to: "recipes#upvote"
          put "dislike", to: "recipes#downvote"
      end
			resources :comments
		end
	 root to: "home#index"
	
	  resources :users do
		resources :recipes
	end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
