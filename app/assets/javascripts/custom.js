$(document).on('ready page:load', function () {
  $('.parallax').parallax();

  $('.add_cat').click(function () {
    $('#modal_add').openModal();
  })

  $('.show-detail').click(function () {
    var category = $(this).data('category');
    $('#modal_' + category).openModal();
  });

  $('.create-and-continue').click(function (e) {
    e.preventDefault();
    var data = $('#form_add').serialize();
    $.ajax({
      type: "POST",
      url: "/categories/",
      data: data,
      success: function () {
        Materialize.toast(I18n.t('js.success'), 2000);
        $('#form_add')[0].reset();
      }
    });
  });

  $('.create').click(function () {
    var data = $('#form_add').serialize();
    $.ajax({
      type: "POST",
      url: "/categories",
      data: data,
      success: function (e) {
        $('#modal_add').closeModal();
        Materialize.toast(e.success, 4000);
        location.reload().delay(4000);
      },
      error: function(e){
        Materialize.toast(e.fail, 4000);
      }
    });
  });

  $('.update').click(function () {
    var event = window.event;
    event.stopPropagation();
    var check = $(this).data('check');
    $('#modal_' + check + '_update').openModal();
  });

  $('.delete').click(function () {
    var event = window.event;
    event.stopPropagation();
    var check = $(this).data('check');
  });

  function addOnChangeEventForCheckboxDelete() {
    var check_deletes = $('[name="check_delete"]');
    for (var i = 0; i < check_deletes.length; i++) {
      $(check_deletes[i]).change(function () {
        var flag_checked = false;
        for (var i = 0; i < check_deletes.length; i++) {
          if (check_deletes[i].checked == true) {
            $('.check-delete').removeClass('disabled');
            flag_checked = true;
            break;
          }
        }
        if (!flag_checked) {
          $('.check-delete').addClass('disabled');
        }
      });
    }
  }

  addOnChangeEventForCheckboxDelete();

  $('.check-delete').click(function () {
    var check_deletes = $('[name="check_delete"]');
    var ids = [];
    for (var i = 0; i < check_deletes.length; i++) {
      if (check_deletes[i].checked == true) {
        var delete_id = check_deletes[i].id.substring(13);
        ids.push(delete_id);
      }
    }
    $.ajax({
      type: "DELETE",
      url: "/delete_categories",
      data: {ids: ids},
      dataType: 'JSON',
      success: function (data) {
        Materialize.toast(I18n.t("js.delete") + data.success, 4000);
        Materialize.toast(I18n.t("js.cannot") + data.fails, 4000);
        location.reload();
      }, error: function (data) {
        alert(I18n.t("js.error"));
      }
    });
  });

  $('.rate').click(function(){
    var id = $(this).data('id');
    $('#modal_' + id).openModal();
  });

  $('.comment').click(function(){
    var id = $(this).data('id');
    $('#modal_' + id + '_comment').openModal();
    $('#send_comment_'+ id).click(function(){
      var content = $('#icon_prefix_' + id).val();
      $.ajax({
        url: 'comments',
        method: 'POST',
        data: {
          comment:
          {content: content, product_id: id}
        },
        dataType: 'JSON',
        success: function(response){
          $('#icon_prefix_' + id).val('');
          $('.comment-content').last().append('<p' +
            ' class="comment-content">content</p>');
        },
        error: function(){
          alert(I18n.t("js.error"));
        }
      });
    });
  });

  $('.approve').click(function(){
    var id = $(this).data('target');
    $('#'+ id).openModal();
  });

  $('.reject').click(function(){
    var id = $(this).data('id');
    var answer = confirm(I18n.t('js.confirm'));
    if (answer){
      $.ajax({
        url: '/suggest_products/'+ id,
        method: 'DELETE',
        data: {suggest_id: id},
        dataType: 'JSON',
        success: function(data){
          alert(data.success);
        },
        error: function(data){
          alert(data.fails);
        }
      });
    }

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

$(document).ready(function(){
  $('#show').click(function(){
    openNav();
  });

  $('#hide').click(function(){
    closeNav();
  });
});

