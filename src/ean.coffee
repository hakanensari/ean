## A minimal EAN and ISBN implementation.

# Takes a string-like representation of an EAN code and returns whether it is
# valid.
isValid = (val) ->
  val.length is 13 and (
    ary = (parseInt x for x in val)
    ary[12] is checkDigit ary[0..11]
  )

# Takes the data digits of an EAN code and calculates their checksum digit.
checkDigit = (ary) ->
  sum = ary
    .reduce((a, x, i) ->
      a.push [x, _weights[i]]
      a
    , [])
    .reduce((a, [x, y]) ->
      a + x * y
    , 0)

  (10 - sum % 10) % 10

# Weights for positions in the EAN code.
_weights = do ->
  ary = []
  ary.push x for x in [1, 3] for [1..6]

  ary

module.exports.isValid    = isValid
module.exports.checkDigit = checkDigit
