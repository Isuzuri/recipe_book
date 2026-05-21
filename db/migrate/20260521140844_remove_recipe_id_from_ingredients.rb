class RemoveRecipeIdFromIngredients < ActiveRecord::Migration[8.1]
  def change
    remove_column :ingredients, :recipe_id, :integer
  end
end
