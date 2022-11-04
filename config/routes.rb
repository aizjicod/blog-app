Rails.application.routes.draw do
  devise_for :users 
  devise_scope :user do
    get "/logout", :to => "devise/sessions#destroy"
  end
  root to: "users#index"
  resources :users do
    resources :posts do
      resources :comments, only: [:create]
      resources :likes, only: [:create]
    end
  end
end
