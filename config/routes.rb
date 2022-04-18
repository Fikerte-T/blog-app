Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  # root "users#index"
  # get 'users' => 'users#index'
  # get 'users/:id' => 'users#show'
  # get 'users/:user_id/posts/' => 'posts#index'
  # get 'users/:user_id/posts/:id' => 'posts#show'
  # Use %i or %I for an array of symbols
  # only: %i[index show]
  resources :users do
    resources :posts do
      resources :comments, only: %i[create]
      resources :likes, only: %i[create]
    end
  end
  # resources :posts do
  #   resources :comments, only: %i[create new]
  #   resources :likes, only: %i[create new]
  # end
end
