$('iframe').contents().find('iframe').each(function() {
  this.contentWindow.onclick = null;
  var body = $(this).contents().find('body');
  body.css('-webkit-user-select', 'auto');
  body[0].oncontextmenu = body[0].onselectstart = null;
});
