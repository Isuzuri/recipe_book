module Api
    module V1
        class RecipesController < ApplicationController
            before_action :set_recipe, only: [ :show ]
            before_action :set_user_recipes, only: [ :update, :destroy ]

            def index
                @recipes = filtered_recipes(Recipe.all)
                render json: @recipes
            end

            def my_recipes
                @recipes = filtered_recipes(current_user.recipes)
                render json: @recipes
            end

            def create
                @recipe = current_user.recipes.build(recipe_params)
                if @recipe.save
                    render json: @recipe
                else
                    render json: @recipe.errors, status: :unprocessable_entity
                end
            end

            def show
                render json: @recipe, include: { recipe_ingredients: { include: :ingredient } }
            end

            def update
                if @recipe.update(recipe_params)
                    render json: @recipe
                else
                    render json: @recipe.errors
                end
            end

            def destroy
                @recipe.destroy
                render json: "Deleted succesfully"
            end

            private


            def recipe_params
                params.require(:recipe).permit(:title, :description, :cooking_time, :servings, :spiciness)
            end

            def set_recipe
                @recipe = Recipe.find_by(id: params[:id])
                render json: "Recipe not found" if @recipe == nil
            end

            def set_user_recipes
                @recipe = current_user.recipes.find_by(id: params[:id])
                render json: "Recipe not found" if @recipe == nil
            end

            def filtered_recipes(scope)
                scope
                    .by_spiciness(params[:spiciness])
                    .cooking_time_less_than(params[:max_cooking_time])
                    .search_by_name(params[:query])
            end
        end
    end
end
