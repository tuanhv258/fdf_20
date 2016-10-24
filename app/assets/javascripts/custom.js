function add_cat(){
  $('#modal_add').openModal();
}

function close_modal(id){
  $('#' + id).closeModal()
  $('#' + id + '_update').openModal();
}

$(document).on('ready page:load',function(){
  $('.parallax').parallax();
  $('.show-detail').click(function(){
    var category = $(this).data('category');
    $('#modal_'+ category).openModal();
  });

});

function openNav() {
  $('#mySidenav').addClass('show-mySide');
  $('#main').addClass('show-myMain');
  $('body').addClass('show-myBody');
  $('#mySidenav').removeClass('hide-mySide');
  $('#main').removeClass('hide-myMain');
  $('body').removeClass('hide-myBody');
}

function closeNav() {
  $('#mySidenav').addClass('hide-mySide');
  $('#main').addClass('hide-myMain');
  $('body').addClass('hide-myBody');
  $('#mySidenav').removeClass('show-mySide');
  $('#main').removeClass('show-myMain');
  $('body').removeClass('show-myBody');
}
