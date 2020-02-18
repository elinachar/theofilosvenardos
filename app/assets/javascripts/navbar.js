$(document).on('turbolinks:load', function() {
  //Navbar

  // Fix the Navbar
  toggleFixedTopNavbar();
  function toggleFixedTopNavbar() {
    // Shift the main-body (.flash-messages for better fade out effect) to the height of the navbar
    var navbarHeight = $("nav").outerHeight();
    // For all pages except the album pages
    if ((window.location.pathname.indexOf("wedding-albums/") > -1) ||
    (window.location.pathname.indexOf("baptism-albums/") > -1 ) ||
    (window.location.pathname.indexOf("interior-albums/") > -1)) {
      $(".navbar").removeClass("fixed-top");
      $(".flash-messages").css("margin-top", 0);
    } else {
      $(".navbar").addClass("fixed-top");
      $(".flash-messages").css("margin-top", $("nav").outerHeight()+14);
    }
  }

  // Shrink Navbar
  // Shrink the Navbar on scroll an undo only for md and lg screens if it is fixed-top
  toggleNavbarShrink();
  // Only for medium and large screens
  function toggleNavbarShrink() {
    //Shrink navbar after scrolling
    $(window).scroll(function() {
      // For all pages except for albums - fixed-top navbar
      if ($(window).width() > 767) {
        if ($(window).scrollTop()> 100) {
          $(".navbar.fixed-top").addClass("navbar-shrink");
        } else {
          $(".navbar.fixed-top").removeClass("navbar-shrink");
        }
      } else {
        $(".navbar.fixed-top").removeClass("navbar-shrink");
      }
    });
  }

  // On resize of window resize the flash-messages accordingly and
  // toggle navbar to shrink or not
  $(window).on('resize', function() {
    toggleFixedTopNavbar();
    toggleNavbarShrink();
  });

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
});
