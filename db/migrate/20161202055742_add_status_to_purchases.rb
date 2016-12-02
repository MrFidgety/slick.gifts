class AddStatusToPurchases < ActiveRecord::Migration
  def change
    remove_column :purchases, :status
    add_column :purchases, :status, :integer, default: 0
  end
end
