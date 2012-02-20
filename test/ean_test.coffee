fs   = require 'fs'
Ean  = require '../src/ean'

describe 'EAN', ->
  describe '#isValid', ->
    describe 'given a code that is not 13 digits', ->
      it 'returns false', ->
        Ean.isValid('foo').should.be.false
    describe 'given a code with an invalid checksum digit', ->
      it 'returns false', ->
        for ean in ['9780826476943', '9780826476941']
          Ean.isValid(ean).should.be.false
    describe 'given a code with a valid checksum digit', ->
      it 'returns true', ->
        eans = fs.readFileSync("#{__dirname}/eans", 'UTF-8')
        for ean in eans.split("\n") when ean.length is 13
          Ean.isValid(ean).should.be.true
