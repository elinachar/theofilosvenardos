$(document).on('turbolinks:load', function() {

  $('img').bind('contextmenu', function(e){
    if(e.button == 2 || e.button == 0) { // right click (2) or long tap (0) on touchscreen
      alert("Sorry. This photo is copyrighted. Contact Theofilos Venardos if you want to download it.");
      return false;
    }
});
})
