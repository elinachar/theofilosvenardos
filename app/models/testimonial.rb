class Testimonial < ApplicationRecord
  mount_uploader :photo, PhotoUploader

  def self.english_testimonials
    Testimonial.where(language_id: 1)
  end

  def self.greek_testimonials
    Testimonial.where(language_id: 2)
  end
end
