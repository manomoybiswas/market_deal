$(document).ready(function(){
  $("#user_password").on("load", function(){
    if ($("#user_password").val().length == 0 ){
      $('#valid_password').hide();
      $('#invalid_password').hide();
      $('#password_error_message').removeClass();
      $('#password_error_message').addClass("danger");
      $('#password_error_message').html("* Atleast 1 alphabate, 1 number, 1 special charecter required.").show();
    }
  });
  $("#user_mobile").on("load", function(){
    if ($("#user_mobile").val().length < 10){
      $('#mobile_error_message').html("* Mobile number must be 10 digits.").show();
    }
  });
  var email_valid = username_valid = mobile_valid = password_valid = confirm_password_valid = false
  $("#user_email").on("change paste keyup", function(){
    if ($("#user_email").val().length == 0){
      $('#invalid_email').hide();
      $('#valid_email').hide();
      $('#email_error_message').hide();
      email_valid = false;
    }
    else{
      $.ajax({
        type:"GET",
        url:"./email_validator",
        dataType:"json",
        data: {email: $("#user_email").val()},
        success:function(result){
          if (result.email_exists == false){
            $('#invalid_email').hide();
            $('#email_error_message').hide();
            $('#valid_email').show();
            email_valid = true;
          }
          else if (result.email_exists == true){
            email_valid = false;
            $('#valid_email').hide();
            $('#invalid_email').show();
            $('#email_error_message').html("Email Id already exist.").show();
          }
        }
      });
    }

    var value = $(this).val();
    if (value.includes("@")) {
      var username = value.split("@");
      $("#user_username").val(username[0]).change();
    }
    else{
      $("#user_username").val(value).change();
    }
  });
  
  $("#user_username").on("change paste keyup", function(){
    if ($("#user_username").val().length == 0){
      $('#invalid_username').hide();
      $('#valid_username').hide();
      $('#username_error_message').hide();
      username_valid = false;
    }
    else{
      $.ajax({
        type:"GET",
        url:"./username_validator",
        dataType:"json",
        data: {username: $("#user_username").val()},
        success:function(result){
          if (result.username_exists == false){
            $('#invalid_username').hide();
            $('#username_error_message').hide();
            $('#valid_username').show();
            username_valid = true;
          }
          else if (result.username_exists == true){
            username_valid = false;
            $('#valid_username').hide();
            $('#invalid_username').show();
            $('#username_error_message').html("Username already exist.").show();
          }
        }
      });
    }
  });

  $("#user_mobile").keypress(function(event){
    var key = event.charCode
    if ((event.location == 3 && key >= 96 && key <= 105) || (key >= 48 && key <= 57) || key == 8) {}
    else{ event.preventDefault(); }
  });

  $("#user_mobile").on("change paste keyup", function(event){
    var phone = $(this).val();
    
    if (phone.length != 10){
      $('#valid_mobile').hide();
      $('#invalid_mobile').show();
      $('#mobile_error_message').html("* Mobile number must be 10 digits.").show();
      $('#user_mobile').focus();
      mobile_valid = false;
    }
    else if (! phone.match(/([6-9][0-9]{9})/)){
      $('#valid_mobile').hide();
      $('#invalid_mobile').show();
      $('#mobile_error_message').html("Invalid mobile number").show();
      $('#user_mobile').focus();
      mobile_valid = false;
    }
    else{
      $.ajax({
        type:"GET",
        url:"./mobile_validator",
        dataType:"json",
        data: {mobile: $("#user_mobile").val()},
        success:function(result){
          if (result.mobile_exists == false){
            $('#invalid_mobile').hide();
            $('#mobile_error_message').hide();
            $('#valid_mobile').show();
            mobile_valid = true;
          }
          else if (result.mobile_exists == true){
            mobile_valid = false;
            $('#valid_mobile').hide();
            $('#invalid_mobile').show();
            $('#mobile_error_message').html("Mobile number already exist.").show();
          }
        }
      });
    }
  });

  $("#user_password").on("change paste keyup", function(){
    var password = $(this).val();
    var strength = 0, present = 0;
    var error = "Required atleast ";
    
    if (password.length >= 6){ 
      strength += 1; 
      present += 1;
    }

    if (password.length >= 10){ strength += 1; }
    
    if (password.match(/([A-Z])/)){ strength += 1; }
    
    if (password.match(/([a-zA-Z])/)){ 
      strength += 1;
      present += 1;
    }
    else{ error = error.concat("1 alphabate, "); }
    
    if (password.match(/([0-9])/)){ 
      strength += 1; 
      present += 1;
    }
    else{ error = error.concat("1 numeric charecter, "); }
    
    if (password.match(/([!,%,&,@,#,$,^,*,?,_,~])/)) { 
      strength += 1; 
      present += 1;
    }
    else{ error =  error.concat("1 Special charecter."); }
    
    if (password.match(/(.*[!,%,&,@,#,$,^,*,?,_,~].*[!,%,&,@,#,$,^,*,?,_,~])/)) { strength += 1 }
    
    if (password.length == 0 ){
      $('#valid_password').hide();
      $('#invalid_password').hide();
      $('#password_error_message').removeClass();
      $('#password_error_message').addClass("danger");
      $('#password_error_message').html("* Atleast 1 alphabate, 1 number, 1 special charecter required.").show();
      password_valid = false;
    }
    else if (password.length>=1 && password.length < 6){
      $('#valid_password').hide();
      $('#invalid_password').show();
      $('#password_error_message').removeClass();
      $('#password_error_message').addClass("danger")
      $('#password_error_message').html("Too short. Atleast 6 charecter").show();
      password_valid = false;
    }
    else if (present < 4){
      $('#valid_password').hide();
      $('#invalid_password').show();
      $('#password_error_message').removeClass();
      $('#password_error_message').addClass("danger")
      $('#password_error_message').html(error).show()
      password_valid = false;
    }
    else{
      $('#invalid_password').hide();
      $('#valid_password').show();
      $('#valid_password').removeClass("good weak strong");
      $('#password_error_message').removeClass();
      if (strength == 4) {
        password_valid = true;
        $('#valid_password').addClass("weak");
        $('#password_error_message').addClass("weak");
        $('#password_error_message').html("Weak").show();
      }
      else if (strength == 5){
        $('#valid_password').addClass("good");
        $('#password_error_message').addClass("good");
        $('#password_error_message').html("Good").show();
        password_valid = true;
      }
      else if (strength == 6){
        $('#valid_password').addClass("strong");
        $('#password_error_message').addClass("strong");
        $('#password_error_message').html("Strong").show();
        password_valid = true;
      }
    }
  });
  $("#user_password_confirmation").on("change paste keyup", function(){
    var password = $("#user_password").val();
    var confirm_password = $(this).val();
    console.log(confirm_password + "==" + password)
    if (confirm_password == password){
      confirm_password_valid = true;
      $('#invalid_confirm_password').hide();
      $('#confirm_password_error_message').hide();
      $('#valid_confirm_password').show();
    }
    else{
      confirm_password_valid = false;
      $('#valid_confirm_password').hide();
      $('#invalid_confirm_password').show();
      $('#confirm_password_error_message').html("password doesn't match").show();
    }
  });

  $("#new_user input").on("blur keyup", function(){
    if (email_valid == true && username_valid == true && mobile_valid == true && password_valid == true && confirm_password_valid == true){
      $("#signup").removeAttr("disabled");
    }
    else{
      $("#signup").attr("disabled", "disabled");
    }
  });
});