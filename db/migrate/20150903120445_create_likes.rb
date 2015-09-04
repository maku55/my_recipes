class CreateLikes < ActiveRecord::Migration
  def up
    create_table :likes do |t|
    	t.boolean :like
    	t.references :chef
    	t.references :recipe

      t.timestamps null: false
    end
  end
  def down
  	drop_table :likes
  end
end
