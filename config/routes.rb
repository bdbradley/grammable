Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
root "grams#index"
#onnects routes to controller
resources :grams, only: [:new, :create]
end
