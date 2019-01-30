class CreateBaptismAlbumTranslations < ActiveRecord::Migration[5.2]
  def change
    create_table :baptism_album_translations do |t|
      t.integer :baptism_album_id
      t.integer :language_id
      t.string :title
      t.text :description
    end
    add_index :baptism_album_translations, :baptism_album_id
    add_index :baptism_album_translations, :language_id
  end
end
