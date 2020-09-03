class AddIndexTitleToBaptismAlbums < ActiveRecord::Migration[5.2]
  def change
    add_index :baptism_album_translations, :title
  end
end
