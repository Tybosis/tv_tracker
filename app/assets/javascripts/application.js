// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require jquery.turbolinks
//= require turbolinks
//= require_tree .

$(document).ready(function(){
  $('.profile-pic.chooser').each(function(){
    $(this).click(function(){
      $('.profile-pic.chooser').each(function(){ $(this).removeClass('selected') });
      pic = "avatars/avatar" + parseInt( $(this).find('img').attr('pic') ) + ".png";
      $(this).addClass('selected')
      $('input#profile-pic').val(pic);
    })
  })
});

show_width = 150;
show_margin = 20;

$(document).ready(function(){
  $('.shows_mover').each(function(){
    shows_count = $(this).children('.show').length
    $(this).width(shows_count * (show_width + show_margin) )
  });

  $('.slideshow_nav .show_slider_left').click(function(){
    mover = $(this).parent().parent().find('.shows_mover')
    slide_left(mover)
  });

  $('.slideshow_nav .show_slider_right').click(function(){
    mover = $(this).parent().parent().find('.shows_mover')
    slide_right(mover)
  });
});

function slide_left(mover){
  left = parseInt( $(mover).css('left') );
  if (Math.abs(left) < show_width)
    $(mover).css('left', 0);
  else
    $(mover).css('left', left + (show_width + show_margin) + "px");
};

function slide_right(mover){
  width = $(mover).width();
  left = parseInt( $(mover).css('left') );

  // alert(width + ", " + (width - 4 * show_width) + ", " + left)
  if (Math.abs(left) > (width - 6 * show_width) )
    return false;

  $(mover).css('left', left - (show_width + show_margin) + "px");
};


