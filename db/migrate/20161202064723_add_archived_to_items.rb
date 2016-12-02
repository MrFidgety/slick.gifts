class AddArchivedToItems < ActiveRecord::Migration
  def change
    add_column :items, :archived, :boolean, default: false
  end
end
