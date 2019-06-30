class AddDateExistsToTestimonials < ActiveRecord::Migration[5.2]
  def change
    add_column :testimonials, :date_exists, :boolean, default: false, null: false
  end
end
