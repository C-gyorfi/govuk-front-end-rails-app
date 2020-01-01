Rails.application.routes.draw do
  root 'pages#home'
  get "/pages/:page", to: "pages#show"

  get '/users', to: 'users#new', as: :new_user
  post '/users', to: "users#create", as: :create_user
  get '/users/success', to: 'users#success', as: :user_success

  # get '/users/:id', to: 'users#show'
  # get '/users/:id/edit', to: 'users#edit'
  # put '/users/:id', to: 'users#update'
  # put '/users/success', to: 'users#success'
  # delete '/users/:id', to: 'users#destroy'

  get "/404", to: "errors#not_found", via: :all
  get "/422", to: "errors#unprocessable_entity", via: :all
  get "/500", to: "errors#internal_server_error", via: :all
end
