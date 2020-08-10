console.log('LOADED THE MOTHERFUCKER');

function openModalBox(){
  console.log('openModalBox RAN')
  var modal = $('.modal, #mask');
  $('.open-modal').on('click', function() {
    modal.fadeIn(300);
  });
  $('.close-modal, #mask').on('click', function() {
    modal.fadeOut(800);
  });
}
openModalBox();
