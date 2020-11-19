Rails.application.routes.draw do
  resources :articles, only: [:index, :create, :show, :destroy, :update]
  # get "/articles", to: "articles#index"
  # post "/articles", to: "articles#create"
  # get "/articles/:id", to: "articles#show"
  # delete "/articles/:id", to: "articles#destroy"
  # put "/articles/:id", to: "articles#update"
  # patch "/articles/:id", to: "articles#update"

  root to: "articles#index"
end
