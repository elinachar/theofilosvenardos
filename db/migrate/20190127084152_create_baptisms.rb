class CreateBaptisms < ActiveRecord::Migration[5.2]
  def change
    create_table :baptisms do |t|
      t.string :photo

      t.timestamps
    end
  end
end
