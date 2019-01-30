class RenameInteriorDesignOnToInteriorOnForInteriorAlbums < ActiveRecord::Migration[5.2]
  def change
    rename_column :interior_albums, :interior_design_on, :interior_on
  end
end
