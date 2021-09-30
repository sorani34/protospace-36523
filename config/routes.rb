Rails.application.routes.draw do
  devise_for :users
  root to: "prototypes#index"
  get 'sign_up', to: 'registrations#new'
  get 'prototypes/index'

  resources :prototypes do
    resources :comments, only: :create
  end
  post '/prototypes/:id', to: 'comments#create'

  resources :users, only: :show

  resources :prototypes, only: [:index, :new, :create, :destroy, :edit, :update, :show]
  resources :prototypes, only: [:title, :catch_copy, :concept, :image, :destroy]
  resources :prototypes, only: [:title, :catch_copy, :concept, :image, :show]
  resources :prototypes, only: [:title, :catch_copy, :concept, :image, :edit]
  resources :prototypes, only: [:title, :catch_copy, :concept, :image, :update]

  resources :prototypes, only: [:new, :create]  do
  resources :prototypes, only: :index
    collection do
      get 'search'
    end
  end
  
end
