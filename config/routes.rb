Rails.application.routes.draw do

  resources :meetings

  root "students#index"

  get '/about', to: 'students#about', as: 'about'

  get '/join', to: 'students#join', as: 'join'

  devise_for :users
  resources :users, except: :create

  post 'create_user' => 'users#create', as: 'create_user'



end
