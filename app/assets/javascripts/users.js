/**************
Variables
***************/
var goal_id,
    user_id = 1;

$(function() {
  /**************
  Load click handlers
  ***************/

  $('.edits').on('click', function() {
    goal_id = parseInt($(this).attr('id'), 10);
    get_edit_partial(goal_id);
    return false;
  });
});

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
      console.log(window.location);
      $('a[href="#tab4"]').click()
    }
  });
};

