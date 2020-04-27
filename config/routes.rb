Rails.application.routes.draw do
  root 'genrus#index'
  devise_for :users
  resources :users
end
