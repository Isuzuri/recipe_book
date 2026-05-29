class Ingredient < ApplicationRecord
  has_many :recipe_ingredients
  has_many :recipe, through: :recipe_ingredients

  before_save :normalize_name

  def normalize_name
    self.name = name.downcase.strip.capitalize
  end
end
