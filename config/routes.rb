Rails.application.routes.draw do
  get "/users/:id", to: "users#show"
  get "/users", to: "users#index"
end
