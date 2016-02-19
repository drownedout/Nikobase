Rails.application.routes.draw do
  devise_for :admins
  root "users#index"
  resources :users do
  	collection do
		get 'search'
		end
	end
	resources :companies, only: [:new, :create]
end
