class AddColumnsToProduct < ActiveRecord::Migration
  def change
    add_column :products, :name, :text
    add_column :products, :description, :text
    add_column :products, :price, :float
  end
end
