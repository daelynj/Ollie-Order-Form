class RemoveFalseColumns < ActiveRecord::Migration[6.0]
  def change
    remove_column :customers, :false
    remove_column :products, :false
    remove_column :orders, :false
  end
end
