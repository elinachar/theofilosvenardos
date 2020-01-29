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

  //Toggle dropdown arrow when navbar collapsed
  $(".navbarDropdown").click(function(){
    var collapsedNavbar = $(".navbar-toggler").is(":visible");
    var icon = $(this).find("i");
    if (collapsedNavbar) {
      if (  $(icon).css( "transform" ) == 'none' ){
        $(icon).css("transform","rotate(-180deg)");
      } else {
        $(icon).css("transform","" );
      };
    };
  });

  // Shift user dropdown based on length of user link
  function shift_user_dropdown() {
    var shift = 195 - $(".user-link .dropdown").width();
    $(".user-link .dropdown-menu").css("margin-left", "-" + shift.toString() + "px");
  }
  shift_user_dropdown();

  // FAQ Page
  // Show/Hide flash on camera in accordion
  $(".card-header").click(function(){
      icon = "#" + this.id + " #flash"
      $(icon).fadeToggle(1500);
  });
});
