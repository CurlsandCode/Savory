class CreateRecipeIngredients < ActiveRecord::Migration[5.1]
  def change
    create_table :recipe_ingredients do |t|
      t.integer :recipe_id
	  t.integer :ingredients_id
	  t.string  :quantity
      t.timestamps
    end
  end
end
