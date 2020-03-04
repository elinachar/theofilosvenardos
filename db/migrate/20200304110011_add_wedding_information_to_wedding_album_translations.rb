class AddWeddingInformationToWeddingAlbumTranslations < ActiveRecord::Migration[5.2]
  def change
    add_column :wedding_album_translations, :text_title, :string
    add_column :wedding_album_translations, :text_description, :string
    add_column :wedding_album_translations, :photography, :string
    add_column :wedding_album_translations, :photography_href, :string
    add_column :wedding_album_translations, :assistant_photographer, :string
    add_column :wedding_album_translations, :assistant_photographer_href, :string
    add_column :wedding_album_translations, :videographer, :string
    add_column :wedding_album_translations, :videographer_href, :string
    add_column :wedding_album_translations, :bridal_dress_veil, :string
    add_column :wedding_album_translations, :bridal_dress_veil_href, :string
    add_column :wedding_album_translations, :bridal_shoes, :string
    add_column :wedding_album_translations, :bridal_shoes_href, :string
    add_column :wedding_album_translations, :grooms_suit, :string
    add_column :wedding_album_translations, :grooms_suit_href, :string
    add_column :wedding_album_translations, :grooms_shoes, :string
    add_column :wedding_album_translations, :grooms_shoes_href, :string
    add_column :wedding_album_translations, :wedding_rings, :string
    add_column :wedding_album_translations, :wedding_rings_href, :string
    add_column :wedding_album_translations, :jewellery, :string
    add_column :wedding_album_translations, :jewellery_href, :string
    add_column :wedding_album_translations, :wedding_planner, :string
    add_column :wedding_album_translations, :wedding_planner_href, :string
    add_column :wedding_album_translations, :wedding_florist, :string
    add_column :wedding_album_translations, :wedding_florist_href, :string
    add_column :wedding_album_translations, :makeup_artist, :string
    add_column :wedding_album_translations, :makeup_artist_href, :string
    add_column :wedding_album_translations, :hairstylist, :string
    add_column :wedding_album_translations, :hairstylist_href, :string
    add_column :wedding_album_translations, :church, :string
    add_column :wedding_album_translations, :church_href, :string
    add_column :wedding_album_translations, :venue, :string
    add_column :wedding_album_translations, :venue_href, :string
  end
end
