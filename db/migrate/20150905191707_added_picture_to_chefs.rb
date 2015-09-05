class AddedPictureToChefs < ActiveRecord::Migration
  def up
  	add_column :chefs, :picture, :string, :after=> 'admin'
  end
  def down
    remove_column :chefs, :picture
  end
end
