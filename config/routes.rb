Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations' }
  resources :tuitts
  root 'tuitts#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # Added this so I can add username and name field to registration form...
end
