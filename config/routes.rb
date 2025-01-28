Rails.application.routes.draw do
  devise_for :users
  resources :posts
  get 'homes/about'
  root to: "homes#top"
  patch 'posts/:id' => 'posts#update', as: 'update_post'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
