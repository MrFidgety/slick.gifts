class CreateWants < ActiveRecord::Migration
  def change
    create_table :wants do |t|
      t.references :user, index: true, foreign_key: true
      t.belongs_to :wanted, polymorphic: true

      t.timestamps null: false
    end
    add_index :wants, [:wanted_id, :wanted_type]
  end
end
