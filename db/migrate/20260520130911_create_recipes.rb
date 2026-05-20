class CreateRecipes < ActiveRecord::Migration[8.1]
  def change
    create_table :recipes do |t|
      t.string :title
      t.text :description
      t.integer :cooking_time
      t.integer :servings
      t.integer :spiciness

      t.timestamps
    end
  end
end
