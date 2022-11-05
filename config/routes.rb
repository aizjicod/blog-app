Rails.application.routes.draw do
  devise_for :users 
  devise_scope :user do
    get "/logout", :to => "devise/sessions#destroy"
  end
  # web routes
  root to: "users#index"
  resources :users do
    resources :posts do
      resources :comments, only: [:create, :destroy]
      resources :likes, only: [:create]
    end
  end
  # API ROUTES
 namespace :api do # /api
  namespace :v1 do # /api/v1
    resources :users do # api/v1/users
      resources :posts, format: :json do # api/v1/users/:user_id/posts
        resources :comments, format: :json # api/v1/users/:user_id/posts/:post_id/comments
      end
    end
  end
end
end
