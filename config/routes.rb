Rails.application.routes.draw do
  devise_for :users, path: "", path_names: {
    sign_in: "login",
    sign_out: "logout",
    registration: "signup"
  }, controllers: {
    registrations: "users/registrations",
    sessions: "users/sessions"
  }

  namespace :api do
    namespace :v1 do
      resources :ingredients

      resources :recipes do
        collection do
          get :my_recipes
        end
      resources :recipe_ingredients
      end
    end
  end
end
