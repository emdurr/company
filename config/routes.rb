Rails.application.routes.draw do
	root 'home#index'

	resources :pets do
		resources :reviews
	end

  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
