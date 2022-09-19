Rails.application.routes.draw do
  devise_for :users, :controllers => {
    registrations: 'registrations'
  }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :posts
  resources :users
  devise_scope :user do
    root to: "devise/sessions#new"
  end
  get 'profiles', to: 'users#show'
  # Defines the root path route ("/")
  # root "articles#index"
end
