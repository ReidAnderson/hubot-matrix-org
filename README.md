# Matrix Adaptor for Hubot

Hubot is a Github sponsored framework that makes it easier to build chatbots. The chatbot itself (www.github.com/github/hubot) requires external adapters to integrate your bot with different services. This npm package supplies the most basic functionality needed to get a chatbot running on the Matrix (www.matrix.org). It will provide hubot with the text sent to the bot, and reply to the room with hubot's response. It's less fully featured than many of the hubot adapters (Slack, gitter, etc) at the moment, but send a PR in or log an issue if there's something you'd like to see that's not provided.

## Getting started

To create the chatbot, follow the hubot instructions at https://hubot.github.com/docs/ to get started. Once you have a hubot locally, run `npm install hubot-matrix-org` to get the Matrix adaptor. In terms of integration with Matrix, our hubot is the same as any other bot. Follow the setup at https://t2bot.io/docs/access_tokens/, to get the access token for your bot (the token itself is under the `Help and About` section of Riot settings). 

Once you have the access token and name of the bot, either:
1. Create a folder named `config` in the home directory of your hubot, and add a `default.json` file like the one below.

   ```
      {
         "access_token": "YOUR_TOKEN_HERE",
         "bot_name": "@BOTNAME:matrix.org"
      }
   ```

2.  Set `process.env.matrixAccessToken` and `process.env.matrixBotName` values for your bot.

You should now be able to message your bot and have it respond with all of your hubot scripts.
