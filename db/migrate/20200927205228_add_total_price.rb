class AddTotalPrice < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :cost, :integer, :default => 0
  end
end
