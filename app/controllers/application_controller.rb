class ApplicationController < ActionController::Base
  before_action :get_instagram_photos

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to main_app.root_url, alert: exception.message
  end

  def get_instagram_photos
    @instagram_photos = []
    media = Instagram.client.user_recent_media
    count = 1
    total_photos = 6
    tag = "wedding"
    media.each do |media|
      if media.caption.text.include? tag
        @instagram_photos.push(media.images.thumbnail.url)
        count += 1
      end
      break if count > total_photos
    end
  end

end
