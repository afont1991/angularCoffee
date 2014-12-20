'use strict'

module.exports = (app) ->

  app.get '/templates/app/:name', (req, res) ->
    res.sendFile "#{process.cwd()}/views/templates/app/#{req.params.name}"

  app.get '*', (req, res) ->
    res.sendFile "#{process.cwd()}/dist/application_layout.html"