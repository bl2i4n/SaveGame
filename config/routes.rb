Rails.application.routes.draw do

  resources :topics do
    resources :bookmarks, except: [:index]
  end

  devise_for :users

  resources :users, only: [:show]

  authenticated :user do
    root 'users#show', as: :authenticated_root
  end

    root 'welcome#index'

end
