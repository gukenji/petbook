Rails.application.routes.draw do
  devise_for :users, :controllers => {
    registrations: 'registrations'
  }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :posts
  devise_scope :user do
    root to: "devise/sessions#new"
  end
  # Defines the root path route ("/")
  # root "articles#index"
end
