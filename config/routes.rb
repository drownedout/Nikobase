Rails.application.routes.draw do
  devise_for :admins
  root "users#index"
  resources :users do
  	collection do
  		post :import
		get 'search'
		end
	end
	resources :companies
end
