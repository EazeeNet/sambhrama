Sambhrama::Application.routes.draw do
  get "news/fetch"
  
  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config

 # get "users/index"
  match 'member_home', :to => 'home#show'
  devise_for :users
 
  
  get "static/about_us"
  get "static/kannada_culture"
  get "static/about_member"
  get "static/contact"
  get "static/video_gallery"
  

  
root :to=> "home#index"
  
  match '/:controller(/:action(/:id))'
  

end
