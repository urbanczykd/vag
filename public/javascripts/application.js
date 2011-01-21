// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
$(function() {
$('#form_box').bind('ajax:before', function(){
  $("#shoutbox_messages").html('Loading...');
});
});

// pagination articles
$(function() {
  $(".pagination a").live("click", function() {
    $(".pagination").html("Page is loading...");
    $.get(this.href, null, null, "script");
    return false;
  });
});