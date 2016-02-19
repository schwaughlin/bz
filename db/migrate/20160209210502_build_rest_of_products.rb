class BuildRestOfProducts < ActiveRecord::Migration
  def change
    add_column :products, :category_code, :text
    add_column :products, :category_name, :text
    add_column :products, :wholesale_price, :float
    add_column :products, :manufacturer, :text
    add_column :products, :product_id, :integer
  end
end
