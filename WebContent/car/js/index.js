$('.accordion-title').click(function(){
  $(this).toggleClass("active").next('.accordion-list').slideToggle();
});