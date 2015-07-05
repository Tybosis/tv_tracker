$(document).ready(function(){
  //set width of slideshow
  //$('#calendar_slideshow').width(shows_count * (show_width + show_margin) )
  var myshows = $('.calendar__banner');

  if (myshows.length === 0) {
    $('.calendar__slideshow_nav').addClass('no-display');
    $( "#calendar__no-shows" ).removeClass( "no-display" );
  } else {
    $('.calendar__slideshow_nav').removeClass('no-display');
    $( "#calendar__no-shows" ).addClass( "no-display" );
  }

  item_width = $('.calendar__item').width() + 3;

  //add event handler to btn left
  $('.calendar__slideshow_nav .calendar__show_slider_left').click(function(){
    slide_left( $('#calendar__slideshow') );
  });

  //add event handler to btn right
  $('.calendar__slideshow_nav .calendar__show_slider_right').click(function(){
    slide_right( $('#calendar__slideshow') );
  });
});

//move slider left
function slide_left(mover){
  left = parseInt( $(mover).css('left') );
  if (Math.abs(left) < item_width)
    $(mover).css('left', 0);
  else
    $(mover).css('left', left + item_width + "px");
}

//move slider right
function slide_right(mover){
  width = $(mover).width();
  left = parseInt( $(mover).css('left') );

  if (Math.abs(left) > (width - 6 * item_width) )
    return false;

  $(mover).css('left', left - item_width + "px");
}
