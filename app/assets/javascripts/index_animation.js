$(document).on('turbolinks:load', function() {
  // Fade in the portfolio links when Portfolio div is scrolled in
  // Only for Index Page
  if (location.origin + "/"== location.href || location.origin == location.href) {
    // Only in not touch screen devices
    try {
      document.createEvent("TouchEvent");
      return;
    } catch (e) {
      var indexPortfolio = $(".index-portfolio");
      var indexPortfolioTop = indexPortfolio.offset().top;
      var windowHeight = $(window).height();

      $(window).scroll(function() {
        var scroll = $(window).scrollTop();
          // Fire up fade in when Portfolio is scrolled in
          if ( scroll >= ( indexPortfolioTop - windowHeight )) {
              $(".index-portfolio .wedding").addClass("fade-right");
              $(".index-portfolio .baptism").addClass("fade-left-1");
              $(".index-portfolio .interior-design").addClass("fade-left-2");
            setTimeout( function() {
              $(".index-portfolio .card img, .index-portfolio .card .hover-text").removeClass("hovered");
            }, 5700)
          }
        });
      } //try
    } //if index

});
