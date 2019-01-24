class WeddingAlbumsController < ApplicationController
  before_action :set_wedding_album, only: [:show, :edit, :update, :destroy]

  # GET /wedding_albums
  # GET /wedding_albums.json
  def index
    # @wedding_albums = WeddingAlbum.all
    language_id = 1
    wedding_album_ids =  WeddingAlbumTranslation.where(language_id: 1).pluck(:wedding_album_id)
    @wedding_albums = WeddingAlbum.find(wedding_album_ids)
    byebug
    
  end

  # GET /wedding_albums/1
  # GET /wedding_albums/1.json
  def show
  end

  # GET /wedding_albums/new
  def new
    @wedding_album = WeddingAlbum.new
    @en = @wedding_album.wedding_album_translations.build(language_id: 1)
    @gr = @wedding_album.wedding_album_translations.build(language_id: 2)
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
        format.json{ render :json => @photo }
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
      params.require(:wedding_album).permit(:photo_url, :wedding_on,
        wedding_album_translations_attributes: [:id, :language_id, :title, :description, :_destroy],
        wedding_photos_attributes: [:id, :photo_url, :_destroy])
    end
end
