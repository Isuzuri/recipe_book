Rails.application.routes.draw do
  resources :recipes do
    resources :ingredients
  end
end
