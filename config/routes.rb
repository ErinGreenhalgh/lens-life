Rails.application.routes.draw do
  root 'users#show'
  get '/auth/github', as: :github_login

  get '/auth/github/callback' => 'sessions#create'
  delete '/logout' => 'sessions#destroy', as: :logout

  resources :repos, only: [:index]
end
