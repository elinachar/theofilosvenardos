$(document).on('turbolinks:load', function() {
  $("#date-exists-cb").on("click", function() {
    $(".date-box").css("color", "red");

    var isDisabled = $("#date-exists-cb").prop('checked')
    console.log(isDisabled)
    if(isDisabled) {
        $(".date-box").removeAttr("disabled");
    } else {
        $(".date-box").attr("disabled","disabled");
        $('select[name="testimonial_on"]').attr("disabled","disabled")
    }
  })


});
