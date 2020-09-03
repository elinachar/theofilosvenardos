class WeddingAlbumsController < ApplicationController
  before_action :set_wedding_album, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  skip_before_action :verify_authenticity_token
  load_and_authorize_resource

  # GET /wedding_albums
  # GET /wedding_albums.json
  def index
    language_id = 1
    @wedding_albums =  WeddingAlbum.includes(:wedding_album_translations).where(wedding_album_translations: { language_id: language_id }).order('wedding_albums.id ASC')
  end

  # GET /wedding_albums/1
  # GET /wedding_albums/1.json
  def show
    # Create an array with the existed weddding information
    @wedding_information = Array.new
    wedding_information_name = ["Photography", "Assistant Photographer", "Videographer",
      "Bridal Dress and Veil", "Bridal Shoes", "Groom's Suit", "Groom's Shoes", "Wedding Rings",
      "Jewellery", "Wedding Planner", "Wedding Florist", "Makeup Artist", "Hairstylist", "Church", "Venue"]
    wedding_information_column = [:photography, :assistant_photographer, :videographer,
      :bridal_dress_veil, :bridal_shoes, :grooms_suit, :grooms_shoes, :wedding_rings,
    :jewellery, :wedding_planner, :wedding_florist, :makeup_artist, :hairstylist, :church, :venue]
    wedding_information_db = @wedding_album.wedding_album_translations.first

    # Loop over the columns with the wedding album information to get only the ones with value
    wedding_information_name.zip(wedding_information_column).each do |name, column|
        if wedding_information_db.read_attribute("#{column}").present?
          value = wedding_information_db.read_attribute(column)
          value_href = wedding_information_db.read_attribute("#{column}_href".to_sym)
          @wedding_information.append([name, value, value_href])
        end
    end

    # Create arrays with the photos for each screen view
    @photos_1_2 = Array.new
    @photos_2_2 = Array.new

    @photos_1_3 = Array.new
    @photos_2_3 = Array.new
    @photos_3_3 = Array.new

    @wedding_album.wedding_photos.order('id ASC').each_with_index do |wedding_photo, i|
      if i % 2 == 0
        @photos_1_2.push(wedding_photo)
      else
        @photos_2_2.push(wedding_photo)
      end

      if i % 3 == 0
        @photos_1_3.push(wedding_photo)
      elsif (i+1) % 3 == 0
        @photos_3_3.push(wedding_photo)
      else
        @photos_2_3.push(wedding_photo)
      end

    end

  end

  # GET /wedding_albums/new
  def new
    @wedding_album = WeddingAlbum.new
    @en = @wedding_album.wedding_album_translations.build(language_id: 1)
    @gr = @wedding_album.wedding_album_translations.build(language_id: 2)
    3.times { @wedding_album.wedding_photos.build}
  end

  # GET /wedding_albums/1/edit
  def edit
  end

  # POST /wedding_albums
  # POST /wedding_albums.json
  def create
    @wedding_album = WeddingAlbum.new(wedding_album_params)

    respond_to do |format|
      if @wedding_album.save
        format.html { redirect_to @wedding_album, notice: 'Wedding album was successfully created.' }
        # format.json { render :show, status: :created, location: @wedding_album }
        format.json{ render :json => @wedding_album }
        format.js
      else
        format.html { render :new }
        format.json { render json: @wedding_album.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /wedding_albums/1
  # PATCH/PUT /wedding_albums/1.json
  def update
    respond_to do |format|
      if @wedding_album.update(wedding_album_params)
        format.html { redirect_to @wedding_album, notice: 'Wedding album was successfully updated.' }
        format.json { render :show, status: :ok, location: @wedding_album }
      else
        format.html { render :edit }
        format.json { render json: @wedding_album.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /wedding_albums/1
  # DELETE /wedding_albums/1.json
  def destroy
    @wedding_album.destroy
    respond_to do |format|
      format.html { redirect_to wedding_albums_url, notice: 'Wedding album was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_wedding_album
      wedding_album_id = WeddingAlbumTranslation.where("title like ?",  params[:title].gsub("-and-"," & ").tr("-"," ")).first.wedding_album_id #Replace first the "-and-" in case there is also "%and%" in the title names (f.e. Andy) and then replace the "-" to spaces in case there were no "-and-" in the string
      @wedding_album = WeddingAlbum.find(wedding_album_id)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def wedding_album_params
      params.require(:wedding_album).permit(:photo, :wedding_on, :photo_square, :remove_photo, :remove_photo_square,
        wedding_album_translations_attributes: [:id, :language_id, :title, :description,
          :text_title, :text_description,
          :photography, :photography_href,
          :assistant_photographer, :assistant_photographer_href,
          :videographer, :videographer_href,
          :bridal_dress_veil, :bridal_dress_veil_href,
          :bridal_shoes, :bridal_shoes_href,
          :grooms_suit, :grooms_suit_href,
          :grooms_shoes, :grooms_shoes_href,
          :wedding_rings, :wedding_rings_href,
          :jewellery, :jewellery_href,
          :wedding_planner, :wedding_planner_href,
          :wedding_florist, :wedding_florist_href,
          :makeup_artist, :makeup_artist_href,
          :hairstylist, :hairstylist_href,
          :church, :church_href,
          :venue, :venue_href,
          :_destroy],
        wedding_photos_attributes: [:id, :photo, :_destroy])
    end
end
