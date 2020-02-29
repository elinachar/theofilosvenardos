class BaptismAlbumTranslation < ApplicationRecord
  belongs_to :baptism_album, optional: true
  belongs_to :language, optional: true
end
