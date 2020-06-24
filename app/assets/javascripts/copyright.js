$(document).on('turbolinks:load', function() {

  $('img').bind('contextmenu', function(e){
    if(e.button == 2) { // right click (2) or long tap (0) on touchscreen (for touch devices see main.scss ->   body:-webkit-touch-callout: none; )
      alert("Sorry. This photo is copyrighted. Contact Theofilos Venardos if you want to download it.");
      return false;
    }
  });
})
