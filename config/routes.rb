Rails.application.routes.draw do

  root "students#index"

  get '/about', to: 'students#about', as: 'about'

  get '/join', to: 'students#join', as: 'join'

  devise_for :users
end
