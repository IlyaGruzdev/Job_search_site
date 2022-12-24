Rails.application.routes.draw do
  resources :users do
    resources :tasks, only: %i[new create update destroy]
  end
 
  resources :users, only: %i[create edit update destroy] do
    resources :responces, only: %i[show]
  end
  resources :tasks, only: %i[new create destroy] do
    resources :responces, only: %i[show]
  end
  resources :users do
    resources :tasks do 
      resources :responces, only: %i[new create]
    end
  end
  resources :tasks, only: %i[edit]
  resource :sessions, only: %i[create destroy]
  
  get 'tasks/show',to: 'tasks#show'
  post 'users/:id/edit', to: 'users#update'
  post 'users/:id', to: 'users#update'
  root 'index#main'
end
