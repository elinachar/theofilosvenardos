class AddIndexTitleToInteriorAlbums < ActiveRecord::Migration[5.2]
  def change
    add_index :interior_album_translations, :title
  end
end
