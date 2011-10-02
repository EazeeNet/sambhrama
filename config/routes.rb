Sambhrama::Application.routes.draw do
  get "users/index"

  devise_for :users
  resource :users
  root :to=> "home#index"
end
