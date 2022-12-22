Rails.application.routes.draw do
  resources :users, only: %i[create edit update destroy] do
    resources :tasks, only: %i[new create]
  end
  resource :sessions, only: %i[new create destroy]
  post 'users/:id/edit', to: 'users#update'
  post 'users/:id', to: 'users#update'
  root 'index#main'
end
