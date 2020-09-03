class BaptismAlbum < ApplicationRecord
  has_many :baptism_album_translations, dependent: :destroy, inverse_of: :baptism_album
  has_many :baptism_photos, dependent: :destroy, inverse_of: :baptism_album

  accepts_nested_attributes_for :baptism_album_translations, allow_destroy: true
  accepts_nested_attributes_for :baptism_photos, allow_destroy: true, reject_if: :all_blank

  mount_uploader :photo, PhotoUploader
  mount_uploader :photo_square, PhotoUploader

  def to_param
    self.baptism_album_translations.first.title.downcase.tr(" ","-").gsub("&","and")
  end
end
