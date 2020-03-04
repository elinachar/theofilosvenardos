// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/
$(document).on('turbolinks:load', function() {
  // Go to top btn
  $(window).scroll(function(){
    if ((window.location.href.indexOf("wedding-albums/") > -1 ) ||
    (window.location.href.indexOf("baptism-albums/") > -1 ) ||
    (window.location.href.indexOf("interior-albums/") > -1 ) ){
      // Show the #go-top when scrolling from top is more than 100px
      if ($(window).scrollTop() > 100) {
        $("#go-top").show();
      } else {
        $("#go-top").hide();
      }

      // Limit the #go-top button till is is up to the "footer .content"
      checkOffset();
    };
  });

  var ta, ha, mba, tb, offset, diff

  function checkOffset() {

    ta = $("#go-top").offset().top;
    ha = $("#go-top").outerHeight();
    mba = parseInt($("#go-top").css("margin-bottom"));
    tb = $("footer .content").offset().top;
    offset = 5

    diff = ta + ha + mba - tb + offset
    if (diff >= 0) {

      $("#go-top").css("margin-bottom", (diff).toString() + "px");

    } else {
      $("#go-top").css("margin-bottom", "0");
    }

  }

  // When the user clicks on the button, scroll to the top of the document
  $("#go-top").on("click", function() {
     $("html, body").animate({ scrollTop: 0 }, "slow");
  });

  // MODAL

  // Open the Modal
  // Hide goTop btn if visible
  $(".open-modal-image").on("click", function(){
    $('#modal').css("display","flex").hide().fadeIn(1000);
    $("#go-top").hide();
    slideIndex = parseInt($(this).attr("data-slide"));
    showSlides(slideIndex);
  });

  // Close the Modal
  $(".close.cursor").on("click", function(){
    closeModal();
  })

  // Key events: Close Modal, Next/Previous Slide
  $(document).keydown(function(event){
    if ($('#modal').is(":visible")) {
      // ESC: Closes Modal
      if (event.keyCode == 27){
        closeModal();
      // Right arrow: next slide
      } else if (event.keyCode == 39) {
          plusSlides(1);
      // Left arrow: previous slide
      } else if (event.keyCode == 37) {
          plusSlides(-1);
      }
    };
  });

  $(".mdl .prev").on("click", function(){
    plusSlides(-1);
  })

  $(".mdl .next").on("click", function(){
    plusSlides(1);
  })

  // Function that closes Modal
  // Show goTop btn if needed
  function closeModal() {
    $('#modal').fadeOut(500);
    if ($(window).scrollTop() > 100) {
      $("#go-top").show();
    }
  }

  // Function for Next/previous controls of slides
  var slideIndex = 0;
  function plusSlides(n) {
    showSlides(slideIndex += n);
  }

  // Function that shows the slides
  function showSlides(n) {
    var i;
    var slides = $(".slides");
    if (n+1 > slides.length) {slideIndex = 0}
    if (n < 0) {slideIndex = slides.length-1}
    for (i = 0; i < slides.length; i++) {
      $(slides[i]).hide();
    }
    $(slides[slideIndex]).show();
  }

});
