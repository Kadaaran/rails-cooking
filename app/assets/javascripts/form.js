$(function() {
  $('form input').keyup(function(){
    var userLength = $('input#user_name').val().length;
    var emailLength = $('input#user_email').val().length;
    $('.button').prop('disabled', userLength < 4 || emailLength < 4);
  });
});
