describe 'AEventProperty', () ->

  it 'before', () ->

    kosher.alias 'fixture', kosher.spec.fixtures.emitters

  describe 'methods', () ->

    describe 'extend', () ->

      it 'should add "eventsListeners" to options', () ->

        kosher.alias 'instance', new kosher.fixture.A

        kosher.instance.options.eventListeners.event.should.be.Array

        kosher.instance.options.eventListeners.event.length.should.eql 2

        kosher.alias 'instance', new kosher.fixture.B

        kosher.instance.options.eventListeners.event.should.be.Array

        kosher.instance.options.eventListeners.event.length.should.eql 1
