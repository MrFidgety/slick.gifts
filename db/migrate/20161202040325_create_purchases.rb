class CreatePurchases < ActiveRecord::Migration
  def change
    create_table :purchases do |t|
      t.text :comment
      t.text :status
      t.belongs_to :purchaseable, polymorphic: true

      t.timestamps null: false
    end
    add_index :purchases, [:purchaseable_id, :purchaseable_type]
  end
end
