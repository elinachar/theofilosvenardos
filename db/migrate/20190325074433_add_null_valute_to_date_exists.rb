class AddNullValuteToDateExists < ActiveRecord::Migration[5.2]
  def up
    change_column :testimonials, :date_exists, :boolean, null: true
  end

  def down
    change_column :testimonials, :date_exists, :boolean, null: false
  end
end
