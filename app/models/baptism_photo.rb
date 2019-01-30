class BaptismPhoto < ApplicationRecord
  belongs_to :baptism_album, optional: true
  mount_uploader :photo, PhotoUploader
end
