class DeletePhotoSquareFromWeddingAlbums < ActiveRecord::Migration[5.2]
  def change
    remove_column :wedding_albums, :photo_square
  end
end
