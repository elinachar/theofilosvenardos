class WeddingAlbumTranslation < ApplicationRecord
  belongs_to :wedding_album, optional: true
  belongs_to :language
end
