Rails.application.routes.draw do
  # STEP 1: A ROUTE triggers a controller action
  # verb "/urls" => "namespace/controllers#action"
  namespace :api do
    post "/orders" =>'orders#create'
    get "/orders" =>'orders#index'
    post "/users" => 'users#create'



    post "/sessions" => 'sessions#create'

    get "products" => 'products#index'
    post "products" => 'products#create'
    get "products/:id" => 'products#show'
    patch "products/:id" => 'products#update'
    delete "products/:id" => 'products#destroy'


  end

end
