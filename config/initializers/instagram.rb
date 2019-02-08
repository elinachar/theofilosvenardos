if Rails.env.production?
  Instagram.configure do |config|
   config.client_id     = ENV["INSTAGRAM_CLIENT_ID"]
   config.client_secret = ENV["INSTAGRAM_CLIENT_SECRET"]
   config.access_token  = ENV["INSTAGRAM_ACCESS_TOKEN"]
  end

else
  Instagram.configure do |config|
   config.client_id     = Rails.application.secrets.instagram_client_id
   config.client_secret = Rails.application.secrets.instagram_client_secret
   config.access_token  = Rails.application.secrets.instagram_access_token
  end
end
