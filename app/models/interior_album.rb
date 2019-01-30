class InteriorAlbum < ApplicationRecord
  has_many :interior_album_translations, dependent: :destroy, inverse_of: :interior_album
  has_many :interior_photos, dependent: :destroy, inverse_of: :interior_album

  accepts_nested_attributes_for :interior_album_translations, allow_destroy: true
  accepts_nested_attributes_for :interior_photos, allow_destroy: true, reject_if: :all_blank

  mount_uploader :photo, PhotoUploader
  mount_uploader :photo_square, PhotoUploader
end
