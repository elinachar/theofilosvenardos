class ApplicationController < ActionController::Base
  before_action :get_instagram_photos

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to main_app.root_url, alert: exception.message
  end

  def get_instagram_photos
    # Get first 20 instagram photos
    @instagram_photos = []
    @instagram_links = []
    index_array = (0..19).to_a
    media = Instagram.client.user_recent_media

    # Extract 6 photos with #wedding tag
    total_photos = 6
    tag = "wedding"
    media.each_with_index do |m ,i|
      if m.caption.text.include? tag
        @instagram_photos.push(m.images.thumbnail.url)
        @instagram_links.push(m.link)
        index_array.delete(i)
      end
      break if @instagram_photos.count == total_photos
    end

    # If #wedding photos are less than 6

    ## Sandbox mode : limited 20 photos
    # then use other photos start from the newest photo
    i = 0
    while @instagram_photos.count < total_photos
      @instagram_photos.push(media[i].images.thumbnail.url)
      @instagram_links.push(media[i].link)
      i += 1
    end

    ## Live mode : load next 20 photos
    # maxId = media.pagination.max_id
    # media = Instagram.client.user_recent_media(max_id: maxId)
    # media.each_with_index do |m ,i|
    #   if m.caption.text.include? tag
    #     @instagram_photos.push(m.images.thumbnail.url)
    #   end
    #   break if @instagram_photos.count == total_photos
    # end


  end
end
