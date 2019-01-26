// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/
$(document).on('turbolinks:load', function() {

  $(".open-modal-image").on("click", function(){
    $('#modal').css("display","flex").hide().fadeIn(1000);
    slideIndex = parseInt($(this).attr("data-slide"));
    showSlides(slideIndex);
  });

  // Close the Modal
  $(".close.cursor").on("click", function(){
      $('#modal').fadeOut(500);
  })

  // Close Modal with Esc key
  $(document).keydown(function(event){
    if (event.keyCode == 27){
      $('#modal').fadeOut(500);
    };
  });

  var slideIndex = 0;

  // Next/previous controls
  function plusSlides(n) {
    showSlides(slideIndex += n);
  }
  $(".mdl .prev").on("click", function(){
    plusSlides(-1);
  })

  $(".mdl .next").on("click", function(){
    plusSlides(1);
  })

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
