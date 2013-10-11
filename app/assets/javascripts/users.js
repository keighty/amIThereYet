/**************
Variables
***************/
var goal_id,
    user_id;

/**************
Reload this javascript to avoid turbolinks caching
***************/
$(function() {
  initPage();
});

$(window).bind('page:change', function() {
  initPage();
});

function initPage() {
  /**************
  Load click handlers
  ***************/

  $('.edits').on('click', function() {
    goal_id = parseInt($(this).attr('id'), 10);
    user_id = parseInt(window.location.pathname.split('/')[2]);
    get_edit_partial(goal_id);
    return false;
  });
}

/**************
Get edit partial
***************/
var get_edit_partial = function get_edit_partial() {
  $.ajax({
    type: "GET",
    url: "http://" + window.location.host + "/users/" + user_id + "/goals/" + goal_id + "/edit",
    dataType: "html",
    success: function(data){
      $('#tab4 .span6').append(data);
      // load new tab
      $('a[href="#tab4"]').click();
    }
  });
};

