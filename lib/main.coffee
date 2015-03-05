Mixto = require 'mixto'

aEventFormatFn = require 'a-event-format-fn'

class AEventProperty extends Mixto

  extended: () ->

    @options ?= {}

    @options.eventListeners ?= {}

    @options.eventFormatFn ?= undefined

    _events = (events) =>

      events.map (event) =>

        @options.eventListeners[event.name] ?= []

        @options.eventListeners[event.name].push event

    _normalize = (list) =>

      _event = @options.eventFormatFn or aEventFormatFn.bind @

      _object = (obj) =>

        return Object.keys(obj).map (name) =>

          return _event

            name: name

            callback: obj[name]

      _array = (arr) =>

        return arr.map (e) => return _event e

      switch

        when Array.isArray list then return _array list

        when typeof list is "object" then return _object list

        else throw new Error "invalid events property #{list}"

    if @events

      _events _normalize @events

      delete @events

module.exports = AEventProperty
