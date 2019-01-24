class PhotoContentsController < ApplicationController

  def create
    @photos = Photo.new(photo_url: params[:file])
    if @photos.save!
      respond_to do |format|
        format.json{ render :json => @photos }
      end
    end
  end

end
