class RecipeIngredient < ActiveRecord::Base
	belongs_to :Recipe
	belongs_to :ingredient
end
