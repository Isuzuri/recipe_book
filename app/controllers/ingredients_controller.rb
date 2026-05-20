class IngredientsController < ApplicationController
    # before_action :set_ingredient, only: [:show, :update, :destroy]

    # def index
    #     @ingredients = Ingredient.all
    #     render json: @ingredients
    # end

    # def create
    #     @ingredients = Ingredient.new(ingredients_params)
    #     if @ingredients.save
    #         render json: @ingredients
    #     else
    #         render json: @ingredients.errors, status: :unprocessable_entity
    #     end
    # end

    # def show
    #         render json: @ingredients
    # end

    # def update
    #     if @ingredients.update(ingredients_params)
    #         render json: @ingredients
    #     else 
    #         render json: @ingredients.errors
    #     end
    # end

    # def destroy
    #     @ingredients.destroy
    #     render json: "Deleted succesfully"
    # end

    # private
    # def ingredients_params
    #     params.require(:ingredients).permit(:name, :amount, :unit)
    # end

    # def set_ingredient
    #     @ingredients = Ingredient.find_by(id: params[:id])
    #     render json: "Ingredients not found" if @ingredients == nil
    # end
end
