
$(document).on('ready page:load', function() {
  $('.user-row').click(load_user);
  $('.center-content').on('click', '.edit', edit_user);
});

function load_user() {
  var id = $(this).data('id');
  $.get('/who_am_i?id=' + id, function(data) {
    load_user_container(data);
  })
}

function edit_user() {
  var id = $(this).data('id');
  $.get('/edit_user?id=' + id, function(data) {
    load_user_container(data);
  })
}

function load_user_container(data) {
  $('.user-container').remove();
  $('.center-content').append(data);    
}
