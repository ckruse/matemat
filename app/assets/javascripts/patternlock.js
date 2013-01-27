
function lockPattern(selector) {
  var alphabet = [
    '', '0', '1', '2', '3',
    '4', '5', '6', '7', '8',
    '9', 'a', 'b', 'c', 'd',
    'e', 'f', 'g', 'h', 'i',
    'j', 'k', 'l', 'm', 'n'
  ]

  $(selector).pattern({
    arrowCorrectImage: '/img/arrow-correct.png',
    arrowIncorrectImage: '/img/arrow-incorrect.png',
    gridSize: 4,
    stop: function(event, ui) {
      var $input = $("input[type=password]");

      var val = ui.pattern.join("");
      $(selector).pattern('clearPattern', true);

      $input.val(val);
      $input.closest("form").submit();
    }
  });
}

/* eof */