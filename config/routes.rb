Rails.application.routes.draw do
  get "/articles", to: "articles#index"
  get "/articles/:id", to: "articles#show"
  delete "/articles/:id", to: "articles#destroy"
end
