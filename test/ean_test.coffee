Ean = require '../src/ean'

seed = (cb) ->
  eanList = require('fs').readFileSync "#{__dirname}/eans", 'UTF-8'
  cb ean for ean in eanList.split "\n" when ean.length is 13

describe 'EAN', ->
  describe '#isValid', ->
    describe 'given a code that is not 13 digits', ->
      it 'returns false', ->
        Ean.isValid('foo').should.be.false

    describe 'given a code with an invalid checksum digit', ->
      it 'returns false', ->
        seed (ean) ->
          (digits = [0..9]).splice(ean[12], 1)
          ean = ean.substr(0, 12) + digits[Math.floor(Math.random() * 8)]
          Ean.isValid(ean).should.be.false

    describe 'given a code with a valid checksum digit', ->
      it 'returns true', ->
        seed (ean) ->
          Ean.isValid(ean).should.be.true
