Rails.application.routes.draw do
  devise_for  :users,
  :path => '',
  :path_names => {  :sign_in =>       'login',
                    :sign_out =>      'logout',
                    :sign_up =>       '',
                    :registration =>  'register',
                    :edit =>          'edit',
                    :cancel =>        'cancel',
                    :confirmation =>  'verification'  }

  root to: "users#index"

  resources :users do
    resources :posts, only: [:index, :new, :create, :show] do
      resources :comments, only: [:create]
      resources :likes, only: [:create]
    end
  end
end
