Rails.application.routes.draw do
  get 'likes/create'
  get 'likes/destroy'
  root 'home#index'
  devise_for :users,controllers:{
    sessions: 'users/sessions',
    registrations: 'users/registrations',
  }
  resources :genrus do
    resources :tweets do
      resources :comments, only: [:show,:create]
      resource :likes, only: [:create,:destroy]
    end
  end
end
