Rails.application.routes.draw do
  
  get 'password_resets/new'
  get 'password_resets/edit'
  get 'sessions/new'
  root 'static_pages#home'
  get '/about', to:'static_pages#about'
  get '/signup', to:'users#new'
  get '/login', to:'sessions#new'
  post '/login', to:'sessions#create'
  delete '/logout', to:'sessions#destroy'
  get '/micropost_search', to:'microposts#search'
  get '/user_search', to:'users#search'
  get 'notifications/index'

  
  resources :users do
    member do
      get :following, :followers
    end
  end

  resources :users
  resources :account_activations, only: [:edit]
  resources :password_resets,     only: [:new, :create, :edit, :update]
  resources :microposts,          only: [:create, :destroy]
  resources :relationships,       only: [:create, :destroy]
  resources :messages,            only: [:create]
  resources :rooms,               only: [:index, :create, :show, :destroy]
  resources :inquiries,           only: [:new, :create]
end
