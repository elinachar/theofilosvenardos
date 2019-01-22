$(document).on('turbolinks:load', function() {

  // FAQ Page
  // Create the faq cards based on faq.js
  for (var i = 0; i < faqs.length; ++i) {
    $(".faq #accordion").append('\
    <div class="card">\
      <button class="btn card-header collapsed" id="heading' + i + '" data-toggle="collapse" data-target="#collapse' + i + '" aria-expanded="false" aria-controls="collapse' + i + '">\
          <div class="row">\
            <span class="col-1 fa-stack p-0" id="camera">\
              <i class="fas fa-camera fa-stack-1x fa-lg"></i>\
              <i class="fas fa-haykal fa-stack-2x" id="flash"></i>\
            </span>\
            <h5 class="col-11 mb-0">' + faqs[i].question + '</h5>\
          </div>\
      </button>\
      <div id="collapse' + i + '" class="collapse" aria-labelledby="heading' + i + '">\
        <div class="col-md-11 offset-md-1 card-body">' + faqs[i].answer + '</div>\
      </div>\
    </div><!-- end card -->\
      ');
  };

  // Show/Hide flash on camera in accordion
  $(".card-header").click(function(){
      icon = "#" + this.id + " #flash"
      $(icon).fadeToggle(1500);
  });
});