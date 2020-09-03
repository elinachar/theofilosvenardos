class AddIndexToTitleInWeddingAlbumTranslations < ActiveRecord::Migration[5.2]
  def change
    add_index :wedding_album_translations, :title
  end
end
