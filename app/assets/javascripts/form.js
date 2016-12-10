$(function() {
  $('.button input').prop('disabled', true);
  $('form input').keyup(function(){
    var userLength = $('input#user_name').val().length;
    var emailLength = $('input#user_email').val().length;
    console.log(userLength, emailLength);
    console.log(userLength > 4 || emailLength > 4);
    if (userLength > 4 || emailLength > 4) {
      $('.button input').removeAttr('disabled');
    }
  });
});
