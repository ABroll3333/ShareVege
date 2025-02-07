Rails.application.routes.draw do
  devise_for :users
  root to: "posts#index"
  resources :posts do
    resources :comments, only: [:create, :destroy]
  end
  get 'homes/about'
  resources :users
  patch 'posts/:id' => 'posts#update', as: 'update_post'
  resources :searches
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
