class CreateRecipeIngredients < ActiveRecord::Migration
  def up
    create_table :recipe_ingredients do |t|
    	t.references :ingredient
    	t.references :recipe

      t.timestamps
    end
  end

  def down
  	drop_table :recipe_ingredients
  end
end
