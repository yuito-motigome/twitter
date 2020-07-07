Rails.application.routes.draw do
  get '/' =>"home#top"
  get "about" => "home#about"
  get "posts/index" => "posts#index"
  get "posts/new" => "posts#new"
  post "posts/create" => "posts#create"
  get "posts/:id/editer" => "posts#editer"
  post "posts/:id/edit" => "posts#edit"
  get "posts/:id" => "posts#show"
  get "posts/:id/erase" => "posts#erase"
  get "users/create" => "users#create"
  post "users/sign_up" => "users#sign_up"
  get "users/log_in" => "users#log_in"
  post "users/sign_in" => "users#sign_in"
  get "users/sign_out" => "users#sign_out"
  get "users/:id/show" => "users#show"
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
