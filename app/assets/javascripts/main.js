$('.gift-wrapper', function() {
  $('.centered').hide()
});

$('.gift-wrapper').on('mouseenter mouseleave', function() {
  $('.centered').toggle()
})
