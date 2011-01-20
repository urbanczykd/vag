// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
$(function() {
$('#form_box').bind('ajax:before', function(){
  $("#shoutbox_messages").html('Loading...');
});
});