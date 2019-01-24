class CreateWeddingAlbumTranslations < ActiveRecord::Migration[5.2]
  def change
    create_table :wedding_album_translations do |t|
      t.integer :wedding_album_id
      t.integer :language_id
      t.string :title
      t.text :description
    end
    add_index :wedding_album_translations, :wedding_album_id
    add_index :wedding_album_translations, :language_id
  end
end
