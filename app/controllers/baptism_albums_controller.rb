class BaptismAlbumsController < ApplicationController
  before_action :set_baptism_album, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:show]
  load_and_authorize_resource


  # GET /baptism_albums
  # GET /baptism_albums.json
  def index
    @baptism_albums = BaptismAlbum.all
  end

  # GET /baptism_albums/1
  # GET /baptism_albums/1.json
  def show
    @photos_1_2 = Array.new
    @photos_2_2 = Array.new

    @photos_1_3 = Array.new
    @photos_2_3 = Array.new
    @photos_3_3 = Array.new

    @baptism_album.baptism_photos.each_with_index do |baptism_photo, i|
      if i % 2 == 0
        @photos_1_2.push(baptism_photo)
      else
        @photos_2_2.push(baptism_photo)
      end

      if i % 3 == 0
        @photos_1_3.push(baptism_photo)
      elsif (i+1) % 3 == 0
        @photos_3_3.push(baptism_photo)
      else
        @photos_2_3.push(baptism_photo)
      end

    end
  end

  # GET /baptism_albums/new
  def new
    @baptism_album = BaptismAlbum.new
    @en = @baptism_album.baptism_album_translations.build(language_id: 1)
    @gr = @baptism_album.baptism_album_translations.build(language_id: 2)
    3.times { @baptism_album.baptism_photos.build}
  end

  # GET /baptism_albums/1/edit
  def edit
  end

  # POST /baptism_albums
  # POST /baptism_albums.json
  def create
    @baptism_album = BaptismAlbum.new(baptism_album_params)
    respond_to do |format|
      if @baptism_album.save
        format.html { redirect_to @baptism_album, notice: 'Baptism album was successfully created.' }
        format.json { render :show, status: :created, location: @baptism_album }
      else
        format.html { render :new }
        format.json { render json: @baptism_album.errors, status: :unprocessable_entity }
      end
    end
  end


  # PATCH/PUT /baptism_albums/1
  # PATCH/PUT /baptism_albums/1.json
  def update
    respond_to do |format|
      if @baptism_album.update(baptism_album_params)
        format.html { redirect_to @baptism_album, notice: 'Baptism was successfully updated.' }
        format.json { render :show, status: :ok, location: @baptism_album }
      else
        format.html { render :edit }
        format.json { render json: @baptism_album.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /baptism_albums/1
  # DELETE /baptism_albums/1.json
  def destroy
    @baptism_album.destroy
    respond_to do |format|
      format.html { redirect_to baptism_albums_url, notice: 'Baptism album was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_baptism_album
      baptism_album_id = BaptismAlbumTranslation.where("title like ?",  params[:title].gsub("-and-"," & ").tr("-"," ")).first.baptism_album_id #Replace first the "-and-" in case there is also "%and%" in the title names (f.e. Andy) and then replace the "-" to spaces in case there were no "-and-" in the string
      @baptism_album = BaptismAlbum.find(baptism_album_id)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def baptism_album_params
      params.require(:baptism_album).permit(:photo, :photo_square, :baptism_on, :remove_photo, :remove_photo_square,
        baptism_album_translations_attributes: [:id, :language_id, :title, :description, :_destroy],
        baptism_photos_attributes: [:id, :photo, :_destroy])
    end

end
