var rowSelector = '.center-content.js-enhance .user-row';

$(document).on('ready page:load', function() {
  $(rowSelector).click(highlightUser);
  // I'm unhappy with the JS replacement completely replacing the sub-container, thus making this selector super-broad
  $(".center-content.js-enhance").on('submit', 'form', ajaxUpdate);
});

function highlightUser() {
  $(rowSelector).removeClass('highlighter');
  $(this).addClass('highlighter');
}

function ajaxUpdate(e) {
  e.preventDefault();
  var url = $(this).attr('action');
  var formData = $(this).serialize();
  var userId = $(this).find("input[name='user[id]']").val();

  $.ajax(url, {
    type: "POST",
    data: formData
  }).done(function(data, textStatus, jqXHR) {
    $(rowSelector + '[data-id="' + userId + '"]').click(); // reselect current item (lazy solution)
  }).fail(function(jqXHR, textStatus, errorThrown) {
    alert('Whoops')
  });
}