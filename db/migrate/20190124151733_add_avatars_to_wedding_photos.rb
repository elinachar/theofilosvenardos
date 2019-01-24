class AddAvatarsToWeddingPhotos < ActiveRecord::Migration[5.2]
  def change
    add_column :wedding_photos, :avatars, :json
  end
end
