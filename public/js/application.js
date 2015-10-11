$(document).ready(function() {
  $("#login_form").on('click', 'input[name=username]', function() {
    if ($(this).val() == "Username")
      $(this).val("");
    else if ($(this).val() == "")
      $(this).val("Username");
  });
  $("#login_form").on('click', 'input[name=password]', function() {
    if ($(this).val() == "Password")
      $(this).val("");
    else if ($(this).val() == "")
      $(this).val("Password");
  });
  $("#signup-username").click( function() {
    if ($(this).val() == "Username")
      $(this).val("");
    else if ($(this).val() == "")
      $(this).val("Username");
  });
  $("#signup-password").click( function() {
    if ($(this).val() == "Password")
      $(this).val("");
    else if ($(this).val() == "")
      $(this).val("Password");
  });
  $("#signup-confirm-password").click( function() {
    if ($(this).val() == "Password")
      $(this).val("");
    else if ($(this).val() == "")
      $(this).val("Password");
  });
  // not working just yet, need to catch right object
  // $("#signup-password").keyup(function(){
  //     if ($(this).find("#list_conf") === undefined)
  //       $(this).append("<p id=\"confpw\">please confirm password</p>");
  //     if ($(this).find("#list_conf").val() == "")
  //       $(this).find("#list_conf").remove();
  // });
});
