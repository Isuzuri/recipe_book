Rails.application.routes.draw do
  resourses :ingredients
  resources :recipes do
    resources :recipe_ingredients
  end
end
