Rails.application.routes.draw do
  post "/signup", to: "users#create"
  post "/login", to: "users#login"

  resources :ingredients

  resources :recipes do
    resources :recipe_ingredients
  end
end
