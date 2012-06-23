App0521::Application.routes.draw do
 
 
  resources :unused_listings

 devise_for :users
 
  #Unused classes=========================   
  #resources :businesses

  #resources :addresses

  #resources :images
  #====================================
  
  #Trying to use Prawn for PDF view
  match "listings/show_notes" => "listings#show_notes", :as => :show_notes
  
  #Commented out by Ash as we donot have a Users controller 
  #Devise has an implicit User controller
  #users must always be below devise_for call in the routes file
  
  resources :users
  
  #Commented by Ash in order to let users be editable, if we were using the Devise provided users controller we would use the following
  #resources :users , :only => [:show, :index] 
  
  #Ensure that resources :listings is ALWAYS below devise_for:users and 
  #also below  match "listings/show_notes" => "listings#show_notes", :as => :show_notes
  resources :listings
  
  #just resources :assets was causing problems because rails assets has a fixed route.
  #The following workaround works so that "s3_assets_path" should work instead of just "assets_path"
  #resources :assets, :path=>'s3_assets', :as=>'s3_assets'
   #this route is for file downloads
  #match "s3_assets/get/:id" => "s3_assets#get", :as => :download
  
  
  
  #If you examine this code, you’ll see that authenticated users 
  #(those who have an account and are logged in) will see the home/index page as the application root 
  #(or home) page. And all other users (those who don’t have an account or who are not logged in) 
  #will see the same home page. The redundancy serves a didactic purpose: 
  #If you decide you want users to see a different page when they log in, 
  #you now know exactly where to change it.
  authenticated :user do
    root :to => "listings#index"
  end
  root :to => "listings#index"
  
  #For map view
  match "/geoView" => "listings#geoView", :as => :geoView
  
 
  
  
   #added by Ash- admin dashboard does not need to be added, deleted or edited
  resources :admin_dash_board,  :only => :index

end
