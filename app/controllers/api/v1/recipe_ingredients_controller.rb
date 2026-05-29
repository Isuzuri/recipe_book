module Api
    module V1
        class RecipeIngredientsController < ApplicationController
            before_action :set_recipe, only: [ :index, :create ]
            before_action :set_recipe_ingredient, only: [ :update, :destroy ]

            def index
                @recipe_ingredients = @recipe.recipe_ingredients.includes(:ingredient)
                render json: @recipe_ingredients
            end

            def create
                @recipe_ingredient = @recipe.recipe_ingredients.build(recipe_ingredient_params)
                if @recipe_ingredient.save
                    render json: @recipe_ingredient
                else
                    render json: @recipe_ingredient.errors, status: :unprocessable_entity
                end
            end

            def update
                if @recipe_ingredient.update(ingredient_params)
                    render json: @recipe_ingredient
                else
                    render json: @recipe_ingredient.errors
                end
            end

            def destroy
                @recipe_ingredient.destroy
                render json: "Deleted succesfully"
            end

            private
            def recipe_ingredient_params
                params.require(:recipe_ingredient).permit(:ingredient_id, :amount, :unit)
            end

            def set_recipe
                @recipe = Recipe.find_by(id: params[:recipe_id])
                render json: "Recipe not found" if @recipe == nil
            end

            def set_recipe_ingredient
                @recipe_ingredient = RecipeIngredient.find_by(id: params[:id])
                render json: "Recipe ingredient not found" if @recipe_ingredient == nil
            end
        end
    end
end
