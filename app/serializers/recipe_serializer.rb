class RecipeSerializer < Panko::Serializer
  attributes :title, :description, :cooking_time, :servings, :spiciness, :created_at, :updated_at

  has_one :user, serializer: UserSerializer
  has_many :recipe_ingredients, serializer: RecipeIngredientSerializer
end