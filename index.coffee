{Robot, Adapter, TextMessage, EnterMessage, LeaveMessage, Response} = require 'hubot'
MatrixClient = require('matrix-bot-sdk').MatrixClient
AutojoinRoomsMixin = require('matrix-bot-sdk').AutojoinRoomsMixin
config = require('config');

TextMessage = require('hubot').TextMessage

class Matrix extends Adapter
  send: (envelope, strings...) ->
    @robot.logger.info "Sending"
    @client.sendMessage envelope.message.id,
      'msgtype': 'm.notice'
      'body': strings[0]
      'responds':
        'sender': envelope.user
        'message': strings[0]
    
  run: ->
    self = @
    @robot.logger.info "Running"

    access_token = process.env.matrixAccessToken
    if !access_token and config.has('access_token')
      access_token = config.get('access_token')

    botName = process.env.matrixBotName
    if !botName and config.has('bot_name')
      botName = config.get('bot_name')

    @client = new MatrixClient("https://matrix.org", access_token);
    AutojoinRoomsMixin.setupOnClient(@client)
    @client.start().then(() => @emit('connected'))

    @client.on 'room.message', (roomId, event) ->
      console.log("Sender: " + event.sender)
      if event.sender == botName
        return
      message = new TextMessage(event.sender, event.content.body, roomId)
      self.receive message
      return

exports.use = (robot) ->
  new Matrix robot
