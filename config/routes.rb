Rails.application.routes.draw do
  root "users#index"
  resources :users do
  	collection do
		get 'search'
		end
	end
end
