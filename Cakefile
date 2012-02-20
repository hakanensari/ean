{exec} = require 'child_process'

run = (cmd) ->
  exec cmd, (err, stdout, stderr) ->
    throw err if err
    console.log stdout + stderr

task 'build', 'Build project', ->
  run 'rm -rf lib/* && coffee --compile --output lib/ src/'

task 'release', 'Release project to npm', ->
  run 'npm publish'

task 'test', 'Run specs', ->
  run 'node_modules/mocha/bin/mocha -R spec test/*.coffee'
