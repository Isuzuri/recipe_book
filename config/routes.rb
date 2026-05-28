Rails.application.routes.draw do
  post "/signup", to: "users#create"
  post "/login", to: "users#login"
  post '/refresh', to: 'users#refresh'

  resources :ingredients

  get '/recipes', to: 'recipes#my_recipes'
  resources :recipes do
    resources :recipe_ingredients
  end
end
