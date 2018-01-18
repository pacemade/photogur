Rails.application.routes.draw do

   root 'pictures#index'

  resource :users, only: [:new, :create]
  resource :sessions, only: %i(new create destroy)
  resources :pictures
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
