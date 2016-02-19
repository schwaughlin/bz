class CategoriesBuild < ActiveRecord::Migration
  def change
    add_column :categories, :category_key, :text
    add_column :categories, :name, :text
    add_column :categories, :priority, :integer
    add_column :categories, :description, :text
    add_column :categories, :parent_key, :text
  end
end
