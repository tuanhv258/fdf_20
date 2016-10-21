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
