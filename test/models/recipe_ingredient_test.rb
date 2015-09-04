# == Schema Information
#
# Table name: recipe_ingredients
#
#  id            :integer          not null, primary key
#  ingredient_id :integer
#  recipe_id     :integer
#  created_at    :datetime
#  updated_at    :datetime
#

require 'test_helper'

class RecipeIngredientTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
