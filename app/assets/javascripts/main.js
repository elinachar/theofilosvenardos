$(document).on('turbolinks:load', function() {
  // Check if touch screen
  // Modify links in index for touch devices
  function is_touch_device() {
    try {
      document.createEvent("TouchEvent");
      $(".index-portfolio").addClass("touch-screen");
      $(".index-portfolio .card img, .index-portfolio .card .hover-text").removeClass("hovered");
      $(".albums.wedding").addClass("touch-screen");
    } catch (e) {
      $(".index-portfolio").removeClass("touch-screen");
      $(".index-portfolio .card img, .index-portfolio .card .hover-text").addClass("hovered");
      $(".albums.wedding").removeClass("touch-screen");
    }
  }
  is_touch_device();

  // INDEX Page
  // Set thumbnail size of instagram photos
  function instagram_thumbnail_size() {
    // Set the size for the thumbnail images
    var thumbnail_dimension = $(".instagram-photo:first-child").width();
    $(".instagram-photo a").css({"height": thumbnail_dimension, "width": thumbnail_dimension });

    // Zoom the image if its height is smaller than the anchor
    var ratio
    $(".instagram-photo img").each(function(index, value) {
      if ( this.height < thumbnail_dimension ) {
        ratio = this.width / this.height;
        $(this).css("transform", "scale(" + ratio + ")");
      }
    })
  }

  instagram_thumbnail_size()
  $(window).on('resize', function() {
    instagram_thumbnail_size()
  })

  // FAQ Page
  // Show/Hide flash on camera in accordion
  $(".card-header").click(function(){
      icon = "#" + this.id + " #flash"
      $(icon).fadeToggle(1500);
  });
});
