class AddForeignKeyToRecipes < ActiveRecord::Migration[8.1]
  def change
    add_foreign_key :recipes, :users
  end
end
