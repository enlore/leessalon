(function() {
  $(function() {
    var s;
    $(window).on('scroll', function() {
      return console.log($(window).scrollTop());
    });
    return s = skrollr.init({
      forceHeight: false
    });
  });

}).call(this);
