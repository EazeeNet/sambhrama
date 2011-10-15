Sambhrama::Application.routes.draw do
 # get "users/index"
  match 'member_home', :to => 'home#show'
  devise_for :users
  
  get "static/about_us"
  get "static/kannada_culture"
  get "static/about_member"
  get "static/contact"
  
  root :to=> "home#index"
  match '/:controller(/:action(/:id))'
end
