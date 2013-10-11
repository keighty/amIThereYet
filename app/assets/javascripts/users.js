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
    // get id
    goal_id = parseInt($(this).attr('id'), 10);
    // get edit partial
    get_edit_partial(goal_id);
    // append edit partial to tab4
    console.log(goal_id);
  });
});

/**************
Get goal edit partial
***************/
var get_edit_partial = function get_edit_partial() {
  $.ajax({
    type: "GET",
    url: "http://" + window.location.host + "/users/" + user_id + "/goals/" + goal_id + "/edit",
    dataType: "html",
    success: function(data){
      console.log(data);
      console.log("hello from ajax");
    }
  });
};