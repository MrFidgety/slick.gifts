class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.text :name
      t.text :comment
      t.text :link
      t.text :code
      t.text :location
      t.text :image

      t.timestamps null: false
    end
    
    add_reference :items, :user, index: true, foreign_key: true
  end
end
