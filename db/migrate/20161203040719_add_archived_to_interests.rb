class AddArchivedToInterests < ActiveRecord::Migration
  def change
    add_column :interests, :archived, :boolean, default: false
  end
end
