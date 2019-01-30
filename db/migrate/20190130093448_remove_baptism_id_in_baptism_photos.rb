class RemoveBaptismIdInBaptismPhotos < ActiveRecord::Migration[5.2]
  def change
    remove_column :baptism_photos, :baptism_id
  end
end
