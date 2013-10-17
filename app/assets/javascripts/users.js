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
    load_ids($(this));
    get_edit_partial();
    return false;
  });
}

/**************
Load user and goal id from edit/delete buttons
***************/
var load_ids = function load_ids(element) {
  goal_id = parseInt(element.attr('id').split('_')[1], 10);
  user_id = parseInt(window.location.pathname.split('/')[2], 10);

  /**************
  Debug goal and user ID
  ***************/
  // console.log(goal_id);
  // console.log(user_id);
};

/**************
Get edit partial
***************/
var get_edit_partial = function get_edit_partial() {
  $.ajax({
    type: "GET",
    url: "/users/" + user_id + "/goals/" + goal_id + "/edit",
    dataType: "html",
    success: function(data){
      $('#tab4 .span6').append(data);
      // load new tab
      $('a[href="#tab4"]').click();
    }
  });
};
