json.extract! testimonial, :id, :signature, :testimonial_on, :description, :photo, :created_at, :updated_at
json.url testimonial_url(testimonial, format: :json)
