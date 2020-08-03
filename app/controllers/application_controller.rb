class ApplicationController < ActionController::Base
  before_action :get_instagram_media

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to main_app.root_url, alert: exception.message
  end

  def get_instagram_media
    if InstagramAccessToken.second.nil?

      entry = InstagramAccessToken.create(access_token: "123456", expires_at: "Mon, 01 01 2020")
      entry.save

    end
    # Check if long-lived access token needs to be refreshed
    expiration_date =  InstagramAccessToken.first.expires_at
    if Date.strptime(expiration_date, "%a, %d %b %Y") <=  Date.today
      client = InstagramBasicDisplay::Client.new
      refresh_request = client.refresh_long_lived_token(token: InstagramAccessToken.first.access_token)

      if refresh_request.success?
        InstagramAccessToken.first.update_attribute(:access_token, refresh_request.payload.access_token)
        new_expiration_date = Date.today + 55.days
        InstagramAccessToken.first.update_attribute(:expires_at, new_expiration_date.strftime("%a, %d %b %Y"))
      else
        render json: refresh_request.error, status: 400
      end
    end

    client = InstagramBasicDisplay::Client.new(auth_token: InstagramAccessToken.first.access_token)
    response = client.media_feed(fields: %i[caption media_url permalink])
    media = response.payload.data

    # Get first 20 instagram photos
    @instagram_media_url = []
    @instagram_links = []
    index_array = (0..19).to_a

    # Extract 6 photos with #wedding tag
    total_photos = 6
    tag = "wedding"
    media.each_with_index do |m ,i|
      unless m["caption"].nil?
        if m["caption"].include? tag
          @instagram_media_url.push(m["media_url"])
          @instagram_links.push(m["permalink"])
          index_array.delete(i)
        end
      end
      break if @instagram_media_url.count == total_photos
    end


    # If #wedding photos are less than 6

    ## Sandbox mode : limited 25 photos
    # then use other photos start from the newest photo
    i = 0
    while @instagram_media_url.count < total_photos
      @instagram_media_url.push(m["media_url"])
      @instagram_links.push(m["permalink"])
      i += 1
    end

  end

end
