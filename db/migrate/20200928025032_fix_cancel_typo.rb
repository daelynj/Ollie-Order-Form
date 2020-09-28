class FixCancelTypo < ActiveRecord::Migration[6.0]
  def change
    rename_column :orders, :cancelled, :canceled
  end
end
