Rails.application.routes.draw do
  get 'users_genrus/create'
  get 'users_genrus/destroy'
  get 'likes/create'
  get 'likes/destroy'
  root 'home#index'
  devise_for :users,controllers:{
    sessions: 'users/sessions',
    registrations: 'users/registrations',
  }
  resources :genrus do
    resource :users_genrus,only: [:create,:destroy]
    resources :tweets do
      resources :comments, only: [:show,:create]
      resource :likes, only: [:create,:destroy]
    end
  end
end
