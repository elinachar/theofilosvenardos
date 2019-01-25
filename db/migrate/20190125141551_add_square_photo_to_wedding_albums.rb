class AddSquarePhotoToWeddingAlbums < ActiveRecord::Migration[5.2]
  def change
    add_column :wedding_albums, :photo_square, :string
  end
end
