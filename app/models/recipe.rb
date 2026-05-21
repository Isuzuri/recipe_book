class Recipe < ApplicationRecord
    has_many :recipe_ingredients
    has_many :ingredients, through: :recipe_ingredients

    validates :title, presence: true
    validates :cooking_time, :servings, numericality: { only_integer: true, greater_than: 0 }
    validates :spiciness, numericality: { only_integer: true, greater_than: 0, less_than_or_equal_to: 5 }
end
