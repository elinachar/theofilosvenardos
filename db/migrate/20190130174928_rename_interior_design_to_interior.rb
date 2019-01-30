class RenameInteriorDesignToInterior < ActiveRecord::Migration[5.2]
  def change
    rename_table :interior_design_albums, :interior_albums
    rename_table :interior_design_translations, :interior_album_translations
    rename_table :interior_design_photos, :interior_photos
  end
end
