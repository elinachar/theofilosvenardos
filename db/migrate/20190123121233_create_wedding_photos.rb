class CreateWeddingPhotos < ActiveRecord::Migration[5.2]
  def change
    create_table :wedding_photos do |t|
      t.integer :wedding_album_id
      t.string :photo_url
    end
    add_index :wedding_photos, :wedding_album_id
  end
end
