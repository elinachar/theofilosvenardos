class CreateInteriorDesignPhotos < ActiveRecord::Migration[5.2]
  def change
    create_table :interior_design_photos do |t|
      t.integer :interior_design_album_id
      t.string :photo
    end
    add_index :interior_design_photos, :interior_design_album_id
  end
end
