class AlterRowId < ActiveRecord::Migration
  def change
    change_column :products, :product_id, :text
  end
end
