class AddForeignKeys < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :orders, :customers
    
    add_foreign_key :line_items, :orders
    add_foreign_key :line_items, :products
  end
end
