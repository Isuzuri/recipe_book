class IngredientsController < ApplicationController
  before_action :set_ingredient, only: [ :show, :update, :destroy ]

    def index
        @ingredients = Ingredient.all
        render json: @ingredients
    end

    def create
        @ingredient = Ingredient.new(ingredient_params)
        if @ingredient.save
            render json: @ingredient
        else
            render json: @ingredient.errors, status: :unprocessable_entity
        end
    end

    def show
            render json: @ingredient
    end

    def update
        if @ingredient.update(ingredient_params)
            render json: @ingredient
        else
            render json: @ingredient.errors
        end
    end

    def destroy
        @ingredient.destroy
        render json: "Deleted succesfully"
    end

    private
    def ingredient_params
        params.require(:ingredient).permit(:name)
    end

    def set_ingredient
        @ingredient = Ingredient.find_by(id: params[:id])
        render json: "Ingredient not found" if @ingredient == nil
    end
end
