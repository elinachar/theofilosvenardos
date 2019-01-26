class CreateInteriorDesigns < ActiveRecord::Migration[5.2]
  def change
    create_table :interior_designs do |t|
      t.string :photo

      t.timestamps
    end
  end
end
