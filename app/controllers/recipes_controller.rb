class RecipesController < ApplicationController
    before_action :set_recipe, only: [ :show, :update, :destroy ]

    def index
        @recipes = Recipe.all
        render json: @recipes
    end

    def create
        @recipe = Recipe.new(recipe_params)
        if @recipe.save
            render json: @recipe
        else
            render json: @recipe.errors, status: :unprocessable_entity
        end
    end

    def show
        render json: @recipe, include: { recipe_ingredients: {include: :ingredient}}
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
end
