(function() {
  var checksum, isValid, _weights;

  isValid = function(val) {
    var ary, x;
    return val.length === 13 && (ary = (function() {
      var _i, _len, _results;
      _results = [];
      for (_i = 0, _len = val.length; _i < _len; _i++) {
        x = val[_i];
        _results.push(parseInt(x));
      }
      return _results;
    })(), ary[12] === checksum(ary.slice(0, 12)));
  };

  checksum = function(ary) {
    var sum;
    sum = ary.reduce(function(a, x, i) {
      a.push([x, _weights[i]]);
      return a;
    }, []).reduce(function(a, _arg) {
      var x, y;
      x = _arg[0], y = _arg[1];
      return a + x * y;
    }, 0);
    return (10 - sum % 10) % 10;
  };

  _weights = (function() {
    var ary, x, _i, _j, _len, _ref;
    ary = [];
    for (_i = 1; _i <= 6; _i++) {
      _ref = [1, 3];
      for (_j = 0, _len = _ref.length; _j < _len; _j++) {
        x = _ref[_j];
        ary.push(x);
      }
    }
    return ary;
  })();

  module.exports = {
    isValid: isValid,
    checksum: checksum
  };

}).call(this);
