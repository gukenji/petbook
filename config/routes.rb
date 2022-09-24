Rails.application.routes.draw do
  devise_for :users, :controllers => {
    registrations: 'registrations'
  }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :posts
  resources :comments
  resources :likes
  resources :users
  resources :invitations, :only => [:index, :new, :create, :destroy]
  resources :friends, :only => [:index, :new, :create, :destroy]
  devise_scope :user do
    root to: "devise/sessions#new"
  end
  get 'profiles', to: 'users#show'
  # Defines the root path route ("/")
  # root "articles#index"
end
