Rails.application.routes.draw do
  root 'users#show'
  get '/auth/instagram', as: :instagram_login

  get '/auth/instagram/callback' => 'sessions#create'
end
