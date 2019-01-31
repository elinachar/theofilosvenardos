class ChangeBaptismToBaptismAlbum < ActiveRecord::Migration[5.2]
  def change
    rename_table :baptisms, :baptism_albums
  end
end
