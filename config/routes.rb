Rails.application.routes.draw do

  get 'likes/index'

  resources :topics do
    resources :bookmarks, except: [:index] do
      resources :likes, only: [:index, :create, :destroy]
    end
  end

  devise_for :users

  # this is already the user profile stuff
  resources :users, only: [:show]

  authenticated :user do
    root 'users#show', as: :authenticated_root
  end

    root 'welcome#index'

    post :incoming, to: 'incoming#create'


end
