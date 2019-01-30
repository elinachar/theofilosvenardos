class AddDateAndPhotoSquareToBaptismAlbums < ActiveRecord::Migration[5.2]
  def change
    add_column :baptism_albums, :photo_square, :string
    add_column :baptism_albums, :baptism_on, :date
  end
end
