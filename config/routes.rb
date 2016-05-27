Rails.application.routes.draw do

  root "students#index"

  get '/about', to: 'students#about', as: 'about'

  devise_for :users
end
