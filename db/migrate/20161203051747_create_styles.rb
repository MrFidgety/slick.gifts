class CreateStyles < ActiveRecord::Migration
  def change
    create_table :styles do |t|
      t.text :name
      t.text :comment
      t.text :size
      t.text :image
      t.references :user, index: true, foreign_key: true
      t.boolean :archived

      t.timestamps null: false
    end
  end
end
