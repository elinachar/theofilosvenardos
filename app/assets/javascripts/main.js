$(document).on('turbolinks:load', function() {
  //Navbar
  // Fixed on top Navbar only for Index Page
  if ( location.href.search("index") != -1 || location.origin + "/"== location.href || location.origin == location.href) {
    $(".navbar").addClass("fixed-top");
    $(".alert").css("margin-top", "110px");
  } else {
    $(".navbar").removeClass("fixed-top");
    $(".alert").css("margin-top", "20px");
  }

  // Check if touch screen
  // Modify links in index for touch devices
  function is_touch_device() {
    try {
      document.createEvent("TouchEvent");
      $(".index-portfolio").addClass("touch-screen");
      $(".albums.wedding").addClass("touch-screen");
    } catch (e) {
      $(".index-portfolio").removeClass("touch-screen");
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
