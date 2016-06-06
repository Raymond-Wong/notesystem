$(document).ready(function() {
  $('#logoutBtn').click(function(e) {
    e.preventDefault();
    $.get('/logout', function(resp) {
      if (resp['code'] != 0) {
        alert('logout failed: ' + resp['msg']);
      } else {
        window.location = resp['msg'];
      }
    })
  });
});