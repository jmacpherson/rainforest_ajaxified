Rainforest02::Application.routes.draw do
  get "sign_in" => "sessions#new"
  get "sign_out" => "sessions#destroy"
  get "users/:user_id/profile" => "profiles#show", as: 'show_user_profile'
  get "profiles" => "profiles#index", as: 'profiles'

  root "products#index"
  resources :products do
     resources :reviews, :except => [:index]
  end
  resources :sessions, :only => [:new, :create, :destroy]

  resources :users, :only => [:new, :create] do
    resource :profile
  end
  
end
