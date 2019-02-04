class AddLanguageIdToTestimonials < ActiveRecord::Migration[5.2]
  def change
    add_column :testimonials, :language_id, :integer
    add_index :testimonials, :language_id
  end
end
