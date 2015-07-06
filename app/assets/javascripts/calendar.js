$(document).ready(function(){
  //set width of slideshow
  //$('#calendar_slideshow').width(shows_count * (show_width + show_margin) )
  var myshows = $('.calendar__banner');
  var didScroll;
  var lastScrollTop = 0;
  var delta = 5;
  var navbarHeight = $('.newbanner').outerHeight() - $('.search-bar').outerHeight();
  var borderWidth = 3;
  var item_width = $('.calendar__item').width() + borderWidth;
  var calendarStartingLeft = $('.calendar__banner').width();

  if (myshows.length === 0) {
    $('.calendar__slideshow_nav').addClass('no-display');
    $( "#calendar__no-shows" ).removeClass( "no-display" );
  } else {
    $('.calendar__slideshow_nav').removeClass('no-display');
    $( "#calendar__no-shows" ).addClass( "no-display" );
  }

  //add event handler to btn left
  $('.calendar__slideshow_nav .calendar__show_slider_left').click(function(){
    slide_left( $('#calendar__slideshow'), item_width, calendarStartingLeft );
  });

  //add event handler to btn right
  $('.calendar__slideshow_nav .calendar__show_slider_right').click(function(){
    slide_right( $('#calendar__slideshow'), item_width );
  });

  $(window).scroll(function(event){
    didScroll = true;
  });

  setInterval(function() {
    if (didScroll) {
      hasScrolled();
      didScroll = false;
    }
  }, 250);

  function hasScrolled() {
    var st = $(this).scrollTop();
    var winHeight = $(window).height();
    var docHeight = $(document).height();
    var itemTop = $('#nav-trigger').position().top;

    if(Math.abs(lastScrollTop - st) <= delta) {
      return;
    }
    if ((st > lastScrollTop && st > navbarHeight) || (lastScrollTop > st && itemTop > navbarHeight)){
      $('#nav-trigger-label').addClass('hide-nav-button');
      $('#nav-trigger').addClass('hide-nav-button');
    } else if (st + winHeight < docHeight) {
      $('#nav-trigger-label').removeClass('hide-nav-button');
      $('#nav-trigger').removeClass('hide-nav-button');
    }
    lastScrollTop = st;
  }
});

//move slider left
function slide_left(mover, itemWidth, calendarStartingLeft){

  var left = parseInt( $(mover).css('left') );

  if (left < calendarStartingLeft - itemWidth) { //keep moving
    $(mover).css('left', ((left + itemWidth) + "px"));
  }
  else {  //stop here
    $(mover).css('left', calendarStartingLeft + "px");
  }
}

//move slider right
function slide_right(mover, itemWidth){
  var width = $(mover).width();
  var left = parseInt( $(mover).css('left') );

  if (Math.abs(left) > (width * itemWidth) ) {
    return false;
  }
  $(mover).css('left', left - itemWidth + "px");
}
