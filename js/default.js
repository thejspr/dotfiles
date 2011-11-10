$(function(){
  $("a").each(function(){
    var _this = $(this);
    _this.attr("href", _this.attr("href").replace(/amazon\.com/, "amazon.co.uk"));
  });
});
