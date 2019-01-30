class CreateBatismPhotos < ActiveRecord::Migration[5.2]
  def change
    create_table :batism_photos do |t|
      t.integer :baptism_id
      t.string :photo
    end
    add_index :batism_photos, :baptism_id
  end
end
