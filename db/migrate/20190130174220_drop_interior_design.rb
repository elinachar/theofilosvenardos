class DropInteriorDesign < ActiveRecord::Migration[5.2]
  def change
    drop_table :interior_designs
  end
end
