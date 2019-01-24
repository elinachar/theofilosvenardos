class WeddingAlbum < ApplicationRecord
  has_many :wedding_album_translations, dependent: :destroy, inverse_of: :wedding_album
  has_many :wedding_photos, dependent: :destroy, inverse_of: :wedding_album

  accepts_nested_attributes_for :wedding_album_translations, allow_destroy: true
  accepts_nested_attributes_for :wedding_photos, allow_destroy: true, reject_if: :all_blank
  # reject_if: proc { |att| att['photo_url'].blank?}

end
