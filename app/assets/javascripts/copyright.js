$(document).on('turbolinks:load', function() {



  $('img').bind('contextmenu', function(e){
    if(e.button == 2) { // right click
      alert("Sorry. This photo is copyrighted. Contact Theofilos Venardos if you want to download it.");
      return false;
    }
});
})
