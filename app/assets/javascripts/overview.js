$(document).on('ready page:load', function() {
  $('.user-row').click(load_user);
  $('.center-content').on('click', '.edit', edit_user);
});

function load_user() {
  var id = $(this).data('id');

  if (document.feature_3) {
    $('[data-id]').removeClass('highlight');
  }

  $.get('/who_am_i?id=' + id, function(data) {
    load_user_container(create_user_html(data));
  })
}

function edit_user() {
  var id = $(this).data('id');

  if (document.feature_3) {
    $('[data-id]').removeClass('highlight');
    $('[data-id=' + id + ']').addClass('highlight');
  }

  $.get('/edit_user?id=' + id, function(data) {
    load_user_container(data);
  })
}

function load_user_container(data) {
  $('.user-container').remove();
  $('.center-content').append(data);    
}

function create_user_html(data) {
  var mr_t = '';
  if (document.feature_3) {
    mr_t = "<div class='mr-t'><img src='https://www.biography.com/.image/c_fill,cs_srgb,dpr_1.0,g_face,h_300,q_80,w_300/MTIwNjA4NjMzNjc0ODkyODEy/mr-t-413140-1-402.jpg'></div>";
  }

  return "<div class='sub-container user-container'>" +
         mr_t +
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
