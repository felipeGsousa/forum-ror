Rails.application.routes.draw do
  resources :foruns do
    resources :posts
  end

  resources :posts do
    resources :comments
  end
  
  get "sign_up", to: "users#new"
  post "sign_up", to: "users#create"

  get "join", to:"joins#new"
  post "join", to:"joins#create"
  delete "leave", to:"joins#destroy"

  get "sign_in", to: "sessions#new"
  post "sign_in", to: "sessions#create"
  delete "logout", to: "sessions#destroy"

  get "user_posts", to: "pages#user_posts"

  get "user_comments", to: "pages#user_comments"
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get '' => 'pages#home'

end
