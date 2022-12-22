Rails.application.routes.draw do
  get 'splashs/index'
  devise_for :users

     resources :splashs, only: [:index]

      resources :groups, only: [:index, :new, :create] do
          resources :charges, only: [:new, :create]
          resources :relations, only: [:index]
      end

      resources :charges, only: [:new, :create]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "groups#index"
end
