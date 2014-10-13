# Cakefile by Avaq <aldwin.vlasblom@gmail.com>

# Dependencies
fs = require 'fs'
fstack = require 'fstack'
path = require 'path'
{spawn, exec} = require 'child_process'

# ANSI Terminal Colours
red = '\x1b[0;31m'
green = '\x1b[0;32m'
bold = '\x1b[0;1m'
reset = '\x1b[0m'

###*
 * Log a message to the console with the given colour.
 *
 * @param {String} color An ANSI terminal colour.
 * @param {String} message The message.
 * @param {String} explanation Extra information to appear at the end of the message.
###
log = (color, message, explanation) -> console.log color + message + reset + ' ' + (explanation or '')

# Remind Windows users that "which" needs to be installed.
try
  which = require('which').sync
catch err
  which = null
  if process.platform.match(/^win/)?
    log red, 'WARNING: the which module is required for windows. Try: npm install which'


##
## TASKS
##

###*
 * Build
 * Compile coffeescript and copy assets.
###
task 'build', 'build using brunch - can watch', (o) -> build o, -> log green, "Build complete."

###*
 * Clean
 * Remove the lib folder.
###
task 'clean', 'remove existing lib directory', -> clean -> log green, "Squeeky clean."

###*
 * Test
 * Runs your test suite.
###
task 'test', 'run tests', -> build -> testem -> pioneer -> log green, "Tests completed."

###*
 * Deploy
 * Runs tests and aborts on failure. Clears existing lib directory. Makes a full build.
###
task 'deploy', 'prepare for deployment', (o) -> clean -> build production:true, -> testem -> pioneer -> log green, "Ready to deploy."

###*
 * Watch
 * Watch option for build, start or test.
###
option '-w', '--watch', 'perform given task in watch mode'


##
## PROGRAM
##

###*
 * Spawn the given command.
 *
 * Pipes stdout and stderr to process respectively. Callback is called after child exits
 * with code 0.
 *
 * @param {String} cmd The path to, or name of of the command.
 * @param {Array} options=[] Arguments to pass to the command.
 * @param {Function} callback Function to call after child exits.
###
launch = (cmd, options=[], callback) ->
  cmd = which(cmd) if which and (cmd.indexOf '/') is -1
  app = spawn cmd, options
  app.stdout.pipe(process.stdout)
  app.stderr.pipe(process.stderr)
  app.on 'exit', (status) -> callback?() if status is 0

###*
 * Builds using brunch.
 *
 * Spawns the `brunch build --production` process. When watch option is given, spawns
 * `brunch watch` instead.
 *
 * @param {Object} options An optional hash of options:
 *                         * `watch`: Boolean. Whether to launch in watch mode.
 *
 * @param {Function} callback Function to call after child exits.
###
build = (options, callback) ->
  if typeof options is 'function'
    callback = options
    options = {}
  args = []
  args.push if 'watch' of options then 'watch' else 'build'
  args.push '--production' if 'production' of options
  launch './brunch', args, callback

###*
 * Remove the current lib directory.
 *
 * @param {Object} options An optional hash of options:
 *                         * `watch`: Boolean. Whether to launch in watch mode.
 *
 * @param {Function} callback Function to call after operation completes.
###
clean = (options, callback) ->
  if typeof options is 'function'
    callback = options
    options = {}
  fstack.delete './lib', callback

###*
 * Run unit tests.
 *
 * Runs in CI mode unless watch is given.
 *
 * @param {Object} options An optional hash of options:
 *                         * `watch`: Boolean. Whether to launch in watch mode.
 *
 * @param {Function} callback Function to call after child exits.
###
testem = (options, callback) ->
  if typeof options is 'function'
    callback = options
    options = {}

  args = []
  args.push 'ci' unless 'watch' of options
  launch './testem', args, callback

###*
 * Run integration tests.
 *
 * @param {Function} callback Function to call after child exits.
###
pioneer = (options, callback) ->
  if typeof options is 'function'
    callback = options
    options = {}

  args = ['--configPath', 'pioneer.json']
  launch './pioneer', args, callback
