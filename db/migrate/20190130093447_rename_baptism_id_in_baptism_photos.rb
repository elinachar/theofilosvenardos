class RenameBaptismIdInBaptismPhotos < ActiveRecord::Migration[5.2]
  def self.down
    remove_column :baptism_photos, :baptism_id
  end

  def change
    add_column :baptism_photos, :baptism_album_id, :integer
    add_index :baptism_photos, :baptism_album_id
  end
end
