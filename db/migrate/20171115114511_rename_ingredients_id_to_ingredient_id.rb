class RenameIngredientsIdToIngredientId < ActiveRecord::Migration[5.1]
  def change
    rename_column :recipe_ingredients, :ingredients_id, :ingredient_id
 end
end
