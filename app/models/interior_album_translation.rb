class InteriorAlbumTranslation < ApplicationRecord
  belongs_to :interior_album, optional: true
  belongs_to :language
end
