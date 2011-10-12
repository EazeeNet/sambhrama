Sambhrama::Application.routes.draw do
 # get "users/index"
  match 'member_home', :to => 'home#show'
  devise_for :users
  root :to=> "home#index"
  match '/:controller(/:action(/:id))'
end
