class InteriorAlbumsController < ApplicationController
  before_action :set_interior_album, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:show]
  skip_before_action :verify_authenticity_token
  load_and_authorize_resource

  # GET /interior_albums
  # GET /interior_albums.json
  def index
    @interior_albums = InteriorAlbum.all
  end

  # GET /interior_albums/1
  # GET /interior_albums/1.json
  def show
    @photos_1_2 = Array.new
    @photos_2_2 = Array.new

    @photos_1_3 = Array.new
    @photos_2_3 = Array.new
    @photos_3_3 = Array.new

    @interior_album.interior_photos.each_with_index do |interior_photo, i|
      if i % 2 == 0
        @photos_1_2.push(interior_photo)
      else
        @photos_2_2.push(interior_photo)
      end

      if i % 3 == 0
        @photos_1_3.push(interior_photo)
      elsif (i+1) % 3 == 0
        @photos_3_3.push(interior_photo)
      else
        @photos_2_3.push(interior_photo)
      end

    end
  end

  # GET /interior_albums/new
  def new
    @interior_album = InteriorAlbum.new
    @en = @interior_album.interior_album_translations.build(language_id: 1)
    @gr = @interior_album.interior_album_translations.build(language_id: 2)
    3.times { @interior_album.interior_photos.build}
  end

  # GET /interior_albums/1/edit
  def edit
  end

  # POST /interior_albums
  # POST /interior_albums.json
  def create
    @interior_album = InteriorAlbum.new(interior_album_params)

    respond_to do |format|
      if @interior_album.save
        format.html { redirect_to @interior_album, notice: 'Interior design album was successfully created.' }
        format.json { render :show, status: :created, location: @interior_album }
      else
        format.html { render :new }
        format.json { render json: @interior_album.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /interior_albums/1
  # PATCH/PUT /interior_albums/1.json
  def update
    respond_to do |format|
      if @interior_album.update(interior_album_params)
        format.html { redirect_to @interior_album, notice: 'Interior design album was successfully updated.' }
        format.json { render :show, status: :ok, location: @interior_album }
      else
        format.html { render :edit }
        format.json { render json: @interior_album.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /interior_albums/1
  # DELETE /interior_albums/1.json
  def destroy
    @interior_album.destroy
    respond_to do |format|
      format.html { redirect_to interior_albums_url, notice: 'Interior design album was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_interior_album
      @interior_album = InteriorAlbum.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def interior_album_params
      params.require(:interior_album).permit(:photo, :interior_on, :photo_square, :remove_photo, :remove_photo_square,
        interior_album_translations_attributes: [:id, :language_id, :title, :description, :_destroy],
        interior_photos_attributes: [:id, :photo, :_destroy])
    end
end
