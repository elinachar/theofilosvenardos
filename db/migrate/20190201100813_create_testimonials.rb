class CreateTestimonials < ActiveRecord::Migration[5.2]
  def change
    create_table :testimonials do |t|
      t.string :signature
      t.date :testimonial_on
      t.text :description
      t.string :photo

      t.timestamps
    end
  end
end
