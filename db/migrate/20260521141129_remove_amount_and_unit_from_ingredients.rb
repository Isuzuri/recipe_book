class RemoveAmountAndUnitFromIngredients < ActiveRecord::Migration[8.1]
  def change
    remove_column :ingredients, :amount, :decimal
    remove_column :ingredients, :unit, :string
  end
end
