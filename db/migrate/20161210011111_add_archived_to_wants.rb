class AddArchivedToWants < ActiveRecord::Migration
  def change
    remove_column :styles, :archived
    remove_column :interests, :archived
    remove_column :items, :archived
    add_column :wants, :archived, :boolean, default: false
  end
end
