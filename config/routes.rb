Rails.application.routes.draw do
  root 'homes#index'
  devise_for :users,controllers:{
    sessions: 'users/sessions',
    registrations: 'users/registrations',
  }
  resource :homes, only: [:index,:show,:update]
  resources :genrus do
    resource :users_genrus,only: [:create,:destroy]
    resources :groups, only: [:new,:create,:destroy,:edit,:update,:show] do
      resource :messages,only:[:create]
      resource :hopes,only: [:create,:destroy,:edit,:update]
    end
    resources :tweets do
      resources :comments, only: [:show,:create]
      resource :likes, only: [:create,:destroy]
    end
    
    member do
      get :search 
    end
  end
end
