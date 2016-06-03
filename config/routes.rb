Rails.application.routes.draw do

  resources :meetings

  root "students#index"

  get '/about', to: 'students#about', as: 'about'

  get '/join', to: 'students#join', as: 'join'

  devise_for :users
  resources :users, except: :create

  get  '/users/:user_id/students/new', to: 'students#new', as: 'teacher_student'
  post '/users/:user_id/students', to: 'students#create'


# edit_user_student GET    /users/:user_id/students/:id/edit(.:format) students#edit
#  user_student GET    /users/:user_id/students/:id(.:format)      students#show
#               PATCH  /users/:user_id/students/:id(.:format)      students#update
#               PUT    /users/:user_id/students/:id(.:format)      students#update
#               DELETE /users/:user_id/students/:id(.:format)      students#destroy

  post 'create_user' => 'users#create', as: 'create_user'



end
