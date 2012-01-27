console.log(window.location);

if (window.location == 'http://localhost:5678/overview') {
  setInterval(function() {
    $.ajax({dataType: 'text', type: 'get', url: href, success: function(data) {
      $('#main').html(data)
      $('#main .time').relatizeDate()
    }})
  }, 2000);
}
