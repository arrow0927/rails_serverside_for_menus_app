App0521::Application.routes.draw do
 
  devise_for :users

  root :to => "listings#index"
  
  resources :listings

  resources :temp_listings

=begin
These are the routes after I ran rake routes

new_user_session GET    /users/sign_in(.:format)          devise/sessions#new
            user_session POST   /users/sign_in(.:format)          devise/sessions#create
    destroy_user_session DELETE /users/sign_out(.:format)         devise/sessions#destroy
           user_password POST   /users/password(.:format)         devise/passwords#create
       new_user_password GET    /users/password/new(.:format)     devise/passwords#new
      edit_user_password GET    /users/password/edit(.:format)    devise/passwords#edit
                         PUT    /users/password(.:format)         devise/passwords#update
cancel_user_registration GET    /users/cancel(.:format)           devise/registrations#cancel
       user_registration POST   /users(.:format)                  devise/registrations#create
   new_user_registration GET    /users/sign_up(.:format)          devise/registrations#new
  edit_user_registration GET    /users/edit(.:format)             devise/registrations#edit
                         PUT    /users(.:format)                  devise/registrations#update
                         DELETE /users(.:format)                  devise/registrations#destroy
                    root        /                                 listings#index
                listings GET    /listings(.:format)               listings#index
                         POST   /listings(.:format)               listings#create
             new_listing GET    /listings/new(.:format)           listings#new
            edit_listing GET    /listings/:id/edit(.:format)      listings#edit
                 listing GET    /listings/:id(.:format)           listings#show
                         PUT    /listings/:id(.:format)           listings#update
                         DELETE /listings/:id(.:format)           listings#destroy
           temp_listings GET    /temp_listings(.:format)          temp_listings#index
                         POST   /temp_listings(.:format)          temp_listings#create
        new_temp_listing GET    /temp_listings/new(.:format)      temp_listings#new
       edit_temp_listing GET    /temp_listings/:id/edit(.:format) temp_listings#edit
            temp_listing GET    /temp_listings/:id(.:format)      temp_listings#show
                         PUT    /temp_listings/:id(.:format)      temp_listings#update
                         DELETE /temp_listings/:id(.:format)      temp_listings#destroy
=end
 
end
