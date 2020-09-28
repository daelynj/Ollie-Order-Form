class AddCancelOption < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :cancelled, :boolean, :default => false
    rename_column :orders, :status, :submitted
  end
end
