class CreateInteriorDesignAlbums < ActiveRecord::Migration[5.2]
  def change
    create_table :interior_design_albums do |t|
      t.string :photo
      t.date :interior_design_on
      t.string :photo_square

      t.timestamps
    end
  end
end
