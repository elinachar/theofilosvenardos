class RenameAssociationsForInterior < ActiveRecord::Migration[5.2]
  def change
    remove_column :interior_album_translations, :interior_design_album_id
    add_column :interior_album_translations, :interior_album_id, :integer
    add_index :interior_album_translations, :interior_album_id

    remove_column :interior_photos, :interior_design_album_id
    add_column :interior_photos, :interior_album_id, :integer
    add_index :interior_photos, :interior_album_id
  end
end
