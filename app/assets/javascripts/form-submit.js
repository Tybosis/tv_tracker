$(document).ready(function(){
  $('#show-show-form').on('ajax:success', function(event, data, status, xhr) {
    window.location.href = "/shows";
    console.log("Ajax form submitted!");
  });
});

