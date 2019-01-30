class InteriorPhoto < ApplicationRecord
  belongs_to :interior_album, optional: true
  mount_uploader :photo, PhotoUploader
end
