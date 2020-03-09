# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = "http://www.theofilosvenardos.com"

SitemapGenerator::Sitemap.compress = false

SitemapGenerator::Sitemap.create do
  # Put links creation logic here.
  #
  # The root path '/' and sitemap index file are added automatically for you.
  # Links are added to the Sitemap in the order they are specified.
  #
  # Usage: add(path, options={})
  #        (default options are used if you don't specify)
  #
  # Defaults: :priority => 0.5, :changefreq => 'weekly',
  #           :lastmod => Time.now, :host => default_host
  #
  # Examples:
  #
  # Add '/articles'
  #
  #   add articles_path, :priority => 0.7, :changefreq => 'daily'
  #
  # Add all articles:
  #
  #   Article.find_each do |article|
  #     add article_path(article), :lastmod => article.updated_at
  #   end
  add about_path
  add contact_path
  add faqs_path


  add wedding_albums_path, changefreq: 'weekly'
  WeddingAlbum.find_each do |wedding_album|
    add wedding_album_path(wedding_album), changefreq: 'weekly', lastmod: wedding_album.updated_at
  end

  add baptism_album_path(BaptismAlbum.first),changefreq: 'weekly', lastmod: BaptismAlbum.first.updated_at
  add interior_album_path(InteriorAlbum.first), changefreq: 'weekly', lastmod: InteriorAlbum.first.updated_at

end
