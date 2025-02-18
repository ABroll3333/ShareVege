Rails.application.routes.draw do
  devise_for :admin, skip: [:registrations, :password], controllers: {
    sessions: 'admin/sessions'
  }
  namespace :admin do
    get 'dashboards', to: 'dashboards#index'
    resources :users, only: [:destroy]
  end
  
  root to: 'public/posts#index'
  scope module: :public do
    devise_for :users
    get 'homes/about', to: 'homes#about', as: :about
    resources :posts do
      resources :comments, only: [:create, :destroy]
    end
    resources :users, only: [:show, :edit, :update]
    patch 'posts/:id' => 'posts#update', as: 'update_post'
    get 'search' => 'searches#search'
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end