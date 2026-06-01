class RecipeIngredientSerializer < Panko::Serializer
  attributes :name, :amount, :unit

  def name
    object.ingredient.name
  end
end