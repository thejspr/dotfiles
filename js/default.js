$(function(){
  $("a").each(function(){
    var _this = $(this);
    if (_this.attr("href") && _this.attr("href").indexOf("amazon") != -1) {
      _this.attr("href", _this.attr("href").replace(/amazon\.com/, "amazon.co.uk"));
      // console.log(_this.attr("href"))
    }
  });
});
