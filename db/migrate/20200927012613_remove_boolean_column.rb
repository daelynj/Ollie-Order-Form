class RemoveBooleanColumn < ActiveRecord::Migration[6.0]
  def change
    remove_column :orders, :boolean
  end
end
