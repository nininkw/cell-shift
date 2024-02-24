$(document).on('turbolinks:load', function() {  
  $('.menu-trigger').on('click',function(){
    if($(this).hasClass('active')){
      $(this).removeClass('active');
      $('main').removeClass('open');
      $('.navigation').removeClass('open');
    } else {
      $(this).addClass('active');
      $('main').addClass('open');
      $('.navigation').addClass('open');
    }
  });
});
