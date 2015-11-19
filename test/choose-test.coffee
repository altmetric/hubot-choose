Helper = require('hubot-test-helper')
expect = require('chai').expect

helper = new Helper('../src/choose.coffee')

class PredictableResponse extends Helper.Response
  random: (items) ->
    items[0]

describe 'choose', ->
  beforeEach ->
    @room = helper.createRoom(httpd: false, response: PredictableResponse)

  context 'when the user asks between two options', ->
    beforeEach (done) ->
      @room.user.say 'alice', 'hubot choose pizza or burgers'
      setTimeout done, 100

    it 'makes a choice', ->
      expect(@room.messages).to.eql [
        ['alice', 'hubot choose pizza or burgers'],
        ['hubot', 'pizza']
      ]

  context 'when the user asks between many options', ->
    beforeEach (done) ->
      @room.user.say 'alice', 'hubot choose pizza, salad, burritos or burgers'
      setTimeout done, 100

    it 'makes a choice', ->
      expect(@room.messages).to.eql [
        ['alice', 'hubot choose pizza, salad, burritos or burgers'],
        ['hubot', 'pizza']
      ]

  context 'when the user asks for a choice between options', ->
    beforeEach (done) ->
      @room.user.say 'alice', 'hubot choose between pizza and sandwiches'
      setTimeout done, 100

    it 'makes a choice', ->
      expect(@room.messages).to.eql [
        ['alice', 'hubot choose between pizza and sandwiches'],
        ['hubot', 'pizza']
      ]

