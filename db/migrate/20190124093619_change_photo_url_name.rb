class ChangePhotoUrlName < ActiveRecord::Migration[5.2]
  def change
    rename_column :wedding_albums, :photo_url, :photo
  end
end
