Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  # root "users#index"
  # get 'users' => 'users#index'
  # get 'users/:id' => 'users#show'
  # get 'users/:user_id/posts/' => 'posts#index'
  # get 'users/:user_id/posts/:id' => 'posts#show'
  # Use %i or %I for an array of symbols
  resources :users, only: %i[index show] do
    resources :posts, only: %i[index show]
  end
end
