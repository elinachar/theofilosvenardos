class CreateInteriorDesignTranslations < ActiveRecord::Migration[5.2]
  def change
    create_table :interior_design_translations do |t|
      t.integer :interior_design_album_id
      t.integer :language_id
      t.string :title
      t.text :description
    end
    add_index :interior_design_translations, :interior_design_album_id
    add_index :interior_design_translations, :language_id
  end
end
