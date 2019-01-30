class ChangeBatismPhotosToBaptismPhotos < ActiveRecord::Migration[5.2]
  def change
    rename_table :batism_photos, :baptism_photos
  end
end
