class WeddingPhoto < ApplicationRecord
  belongs_to :wedding_album, optional: true
  mount_uploader :photo, PhotoUploader
end
