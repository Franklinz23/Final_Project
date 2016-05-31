Rails.application.routes.draw do

  resources :events
  root "students#index"

  get '/about', to: 'students#about', as: 'about'

  get '/join', to: 'students#join', as: 'join'

  get '/parents', to: 'students#parents', as: 'parents'

  devise_for :users
end
