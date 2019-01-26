class DropPhotoSquare < ActiveRecord::Migration[5.2]
  def change
    drop_table :wedding_photo_squares
  end
end
