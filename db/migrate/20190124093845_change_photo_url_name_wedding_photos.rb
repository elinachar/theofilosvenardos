class ChangePhotoUrlNameWeddingPhotos < ActiveRecord::Migration[5.2]
  def change
    rename_column :wedding_photos, :photo_url, :photo
  end
end
