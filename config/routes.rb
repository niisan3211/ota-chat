Rails.application.routes.draw do
  root 'home#index'
  devise_for :users,controllers:{
    sessions: 'users/sessions',
    registrations: 'users/registrations',
  }
  resources :genrus do
    resource :users_genrus,only: [:create,:destroy]
    resources :groups, only: [:new,:create,:destroy,:edit,:update,:show]
    resources :tweets do
      resources :comments, only: [:show,:create]
      resource :likes, only: [:create,:destroy]
    end
  end
end
