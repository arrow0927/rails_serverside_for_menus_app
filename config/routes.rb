App0521::Application.routes.draw do
 
  resources :images

  devise_for :users

  #Commented out by Ash as we donot have a Users controller 
  #Devise has an implicit User controller
  #resources :users, :only => [:show, :index]
  
  authenticated :user do
    root :to => "listings#index"
  end
  
  root :to => "listings#index"
  
  resources :listings

   #added by Ash
  resources :admin_dash_board, :only => :index

end
