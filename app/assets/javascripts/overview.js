
$(document).on('ready page:load', function() {
  $('.user-row').click(load_user);
  $('.center-content').on('click', '.edit', edit_user);
  $('form').parsley();
});

function load_user() {
  var id = $(this).data('id');
  $.get('/who_am_i?id=' + id, function(data) {
    load_user_container(create_user_html(data));
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

function create_user_html(data) {
  return "<div class='sub-container user-container'>" +
         "   <div class='row'>" +
         "     <img src='https://robohash.org/" + data.role + data.middle_name + ".png' class='robot' />" +
         "   </div>" +
         "   <div class='row name'>" +
         "     <p>" + data.first_name + "</p>" +
         "     <p>" + data.middle_name + "</p>" +
         "     <p>" + data.last_name + "</p>" +
         "     <p>the " + data.role + "</p>" +
         "   </div>" +
         "   <div class='row'>" +
         "     <input type='button' class='btn edit' value='Edit' data-id='" + data.id + "' />" +
         "   </div>" +
         "</div>";
}
