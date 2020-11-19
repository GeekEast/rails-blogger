Rails.application.routes.draw do
  get "/articles", to: "articles#index"
  post "/articles", to: "articles#create"
  get "/articles/:id", to: "articles#show"
  delete "/articles/:id", to: "articles#destroy"
  put "/articles/:id", to: "articles#update"
  patch "/articles/:id", to: "articles#update"
end
