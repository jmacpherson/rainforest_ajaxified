Rainforest02::Application.routes.draw do
  get "sign_in" => "sessions#new"
  get "sign_out" => "sessions#destroy"
  get "profile" => "profiles#show"
  # get "profiles" => "profiles#index"
  # get "new_profile" => "profiles#new"


  root "products#index"
  resources :products do
     resources :reviews, :except => [:index]
  end
  resources :sessions, :only => [:new, :create, :destroy]

  resources :users, :only => [:new, :create] do
    resource :profile
  end
  
end
