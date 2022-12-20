Rails.application.routes.draw do
  resources :users, only: %i[new create]  
  resource :sessions, only: %i[new create destroy]
  root 'index#main'
end
