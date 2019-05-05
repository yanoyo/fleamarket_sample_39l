$(function(){
  $(".btn--purchase").click(function() {
    $(".modal-overlay").fadeIn(200);
    $(".modal-screen").fadeIn(200);
  });
  $(".close-btn").click(function() {
    window.location.href = '/';
  });
});