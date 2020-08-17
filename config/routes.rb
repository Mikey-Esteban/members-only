Rails.application.routes.draw do
  devise_for :members, :controllers => { registrations: 'registrations'}
  resources :members, only: [:index, :show]

  resources :posts do
    resources :comments, only: [:create, :edit, :destroy]
  end

  resources :posts, only: :index do
    member do
      post 'toggle_follow', to: 'posts#toggle_follow'
      post 'toggle_favorite', to: 'posts#toggle_favorite'
    end
  end

  get "/pages/:page" => "pages#show"

  root to: 'posts#index'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
