class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.integer :customer_id, false
      t.boolean :status, :boolean, :default => false

      t.timestamps
    end
  end
end
