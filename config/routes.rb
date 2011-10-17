Sambhrama::Application.routes.draw do
  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config

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
