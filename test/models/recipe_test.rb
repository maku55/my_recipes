# == Schema Information
#
# Table name: recipes
#
#  id          :integer          not null, primary key
#  chef_id     :integer
#  name        :string(255)
#  summary     :text(65535)
#  description :text(65535)
#  picture     :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#

require 'test_helper'

class RecipeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
