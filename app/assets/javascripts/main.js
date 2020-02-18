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

  // FAQ Page
  // Show/Hide flash on camera in accordion
  $(".card-header").click(function(){
      icon = "#" + this.id + " #flash"
      $(icon).fadeToggle(1500);
  });
});
