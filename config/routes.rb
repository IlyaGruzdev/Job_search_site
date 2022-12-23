Rails.application.routes.draw do
  resources :users, only: %i[create edit update destroy] do
    resources :tasks, only: %i[new create]
  end
 
  resources :users, only: %i[create edit update destroy] do
    resources :responces, only: %i[show]
  end
  resources :tasks do
    resources :responces, only: %i[show]
  end
  resources :users do
    resources :tasks do 
      resources :responces, only: %i[new create]
    end
  end
  resource :sessions, only: %i[create destroy]
  get 'tasks/show',to: 'tasks#show'
  post 'users/:id/edit', to: 'users#update'

  post 'users/:id', to: 'users#update'
  root 'index#main'
end
