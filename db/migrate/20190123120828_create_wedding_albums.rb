class CreateWeddingAlbums < ActiveRecord::Migration[5.2]
  def change
    create_table :wedding_albums do |t|
      t.string :photo_url
      t.date :wedding_on

      t.timestamps
    end
  end
end
