module.exports = Cow = class Cow

  constructor: (@name = "Anon") ->

  moo: (at = "world") ->
    return "Moo #{at}!"

  consoleMoo: (at) ->
    console.log @moo at
