class AddPriceConstraint < ActiveRecord::Migration[6.0]
  def change
    change_column_null :products, :price, false
  end
end
