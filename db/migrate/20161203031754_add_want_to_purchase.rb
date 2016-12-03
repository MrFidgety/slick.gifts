class AddWantToPurchase < ActiveRecord::Migration
  def change
    remove_column :purchases, :purchaseable_id
    remove_column :purchases, :purchaseable_type
    
    add_reference :purchases, :want, index: true, foreign_key: true
  end
end
