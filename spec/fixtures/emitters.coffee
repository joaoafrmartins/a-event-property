{ EventEmitter } = require 'events'

kosher.alias 'AEventProperty'

class AEmitter extends EventEmitter

  constructor: (@options={}) ->

    super

    kosher.AEventProperty.extend @

class A extends AEmitter

  events: [

    { name: "event", callback: () -> }

    { name: "event", callback: () -> }

  ]

class B extends AEmitter

  events:

    "event": () ->

module.exports =

  "A": A

  "B": B
