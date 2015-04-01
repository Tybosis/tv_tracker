// $(document).ready(function(){
//   $('.profile-pic.chooser').each(function(){
//     $(this).click(function(){
//       $('.profile-pic.chooser').each(function(){ $(this).removeClass('selected') });
//       pic = "avatars/avatar" + parseInt( $(this).find('img').attr('pic') ) + ".png";
//       $(this).addClass('selected')
//       $('input#profile-pic').val(pic);
//     })
//   })
// });


$(document).ready(function(){
  $('#add_profile_btn').click(function(e){
    e.preventDefault();
    $('#add_profile_form').height("150px");
  });
});
