$(document).ready(function(){
  //set width of slideshow
  //$('#calendar_slideshow').width(shows_count * (show_width + show_margin) )

  item_width = $('.calendar_item').width() + 3;

  //add event handler to btn left
  $('.slideshow_nav .show_slider_left').click(function(){
    slide_left( $('#calendar_slideshow') );
  });

  //add event handler to btn right
  $('.slideshow_nav .show_slider_right').click(function(){
    slide_right( $('#calendar_slideshow') );
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


