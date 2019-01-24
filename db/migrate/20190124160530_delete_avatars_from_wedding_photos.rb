class DeleteAvatarsFromWeddingPhotos < ActiveRecord::Migration[5.2]
  def change
    remove_column :wedding_photos, :avatars
  end
end
