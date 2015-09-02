class AddAnAdminColumn < ActiveRecord::Migration
  def up
  	add_column :chefs, :admin, :boolean, after: :password_digest, default: false 
  end
  def down
  	remove_column :chefs, :admin
  end
end
