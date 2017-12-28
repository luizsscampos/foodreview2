Rails.application.routes.draw do
    #   get 'restaurants/index'

    # For details on the DSL available within this file, 
    #   see http://guides.rubyonrails.org/routing.html
    root to:"restaurants#index"
    
    resources :restaurants
    # Add following paths for restaurants
    # Prefix              Verb        URI Pattern                     Controller#Action
    # root                GET         /                               restaurant#index
    # restaurants         GET         /restaurants(.:format)          restaurants#index
    #                     POST        /restaurants(.:format)          restaurants#create
    # new_restaurant      GET         /restaurants/new(.:format)      restaurants#new
    # edit_restaurant     GET         /restaurants/:id/edit(.:format) restaurants#edit
    #      restaurant     GET         /restaurants/:id(.:format)      restaurants#show
    #                     PATCH       /restaurants/:id(.:format)      restaurants#update
    #                     PUT         /restaurants/:id(.:format)      restaurants#update
    #                     DELETE      /restaurants/:id(.:format)      restaurants#destroy

end
