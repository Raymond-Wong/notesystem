$(document).ready(function() {
  loginAction();
  toSignUpAction();
  signUpAction();
});

var loginAction = function() {
  $('#loginBtn').click(function() {
    var account = $('#la').val();
    var password = $('#lpwd').val();
    if (account == '') {
      alert('account cannot be empty');
      return false;
    }
    if (password == '') {
      alert('password cannot be empty');
      return false;
    }
    $.post('/login', {'account' : account, 'password' : password}, function(resp) {
      if (resp['code'] != 0) {
        alert('login failed: ' + resp['msg']);
      } else {
        window.location = resp['msg'];
      }
    });
  });
}

var toSignUpAction = function() {
  $('#toSignUpBtn').click(function() {
    $('.loginContent').hide();
    $('.registerContent').show();
  });
}

var signUpAction = function() {
  $('#signUpBtn').click(function() {
    var account = $('#ra').val();
    var password = $('#rpwd').val();
    var pwdConfirm = $('#rpwdc').val();
    if (account == '') {
      alert('account cannot be empty');
      return false;
    }
    if (password == '') {
      alert('password cannot be empty');
      return false;
    }
    if (password != pwdConfirm) {
      alert('password confirm error');
      return false;
    }
    $.post('/register', {'account' : account, 'password' : password}, function(resp) {
      if (resp['code'] != 0) {
        alert('sign up failed: ' + resp['msg']);
      } else {
        window.location = resp['msg'];
      }
    });
  });
}