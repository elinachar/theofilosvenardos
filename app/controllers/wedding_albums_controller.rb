class WeddingAlbumsController < ApplicationController
  before_action :set_wedding_album, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  load_and_authorize_resource

  # GET /wedding_albums
  # GET /wedding_albums.json
  def index
    language_id = 1
    @wedding_albums =  WeddingAlbum.includes(:wedding_album_translations).where(wedding_album_translations: { language_id: language_id })
    # byebug
  end

  # GET /wedding_albums/1
  # GET /wedding_albums/1.json
  def show
    @photos_1_2 = Array.new
    @photos_2_2 = Array.new

    @photos_1_3 = Array.new
    @photos_2_3 = Array.new
    @photos_3_3 = Array.new

    @wedding_album.wedding_photos.each_with_index do |wedding_photo, i|
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
      @wedding_album = WeddingAlbum.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def wedding_album_params
      params.require(:wedding_album).permit(:photo, :wedding_on, :photo_square, :remove_photo, :remove_photo_square,
        wedding_album_translations_attributes: [:id, :language_id, :title, :description, :_destroy],
        wedding_photos_attributes: [:id, :photo, :_destroy])
    end
end
