
function lockPattern(selector) {
  var alphabet = [
    '',  '0', 'a', '1', 'b',
    '2', 'c', '3', 'd', '4',
    'e', '5', 'f', '6', 'g',
    '7', 'h', '8', 'i', '9',
    'j', 'K', 'l', 'M', 'n', 'O'
  ]

  $(selector).pattern({
    arrowCorrectImage: '/img/arrow-correct.png',
    arrowIncorrectImage: '/img/arrow-incorrect.png',
    gridSize: 5,
    stop: function(event, ui) {
      var $input = $("input[type=password]");

      var val = "";
      for(var i = 0; i < ui.pattern.length; ++i) {
        val += alphabet[ui.pattern[i]] + ",";
      }

      $(selector).pattern('clearPattern', true);

      $input.val(val);
      $input.closest("form").submit();
    }
  });
}

/* eof */