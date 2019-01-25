class CreateWeddingPhotoSquares < ActiveRecord::Migration[5.2]
  def change
    create_table :wedding_photo_squares do |t|
      t.integer :wedding_album_id
      t.string :photo
    end
    add_index :wedding_photo_squares, :wedding_album_id
  end
end
