class AddDefaultValuteToDateExists < ActiveRecord::Migration[5.2]
  def up
    change_column :testimonials, :date_exists, :boolean, default: true
  end

  def down
    change_column :testimonials, :date_exists, :boolean, default: nil
  end
end
