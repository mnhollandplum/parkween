$(document).ready(function(){
  if($("#parking-form").length > 0) {
    $("#parking-section-a-button").click(function(event){
      event.preventDefault();
      $("#parking-section-a").hide();
      $("#parking-section-b").show();
    });

    $("#parking-section-b-button").click(function(event){
      event.preventDefault();
      $("#parking-section-b").hide();
      $("#parking-section-c").show();
    });
  }
});
