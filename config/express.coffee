'use strict'

bodyParser = require 'body-parser'
compression = require 'compression'
express = require 'express'
logger = require './logger'

module.exports = (app) ->
  app.use compression()

  app.engine 'html', require 'hogan-express'
  app.set 'view engine', 'html'

  app.use '/fonts', express.static "#{process.cwd()}/dist/assets/fonts"
  app.use '/assets', express.static "#{process.cwd()}/dist/assets"

  app.use bodyParser.urlencoded
    extended: true
  app.use bodyParser.json()

  app.use (req, res, next) ->
    logger.info "HTTP #{res.statusCode} #{req.method} #{req.url}"
    next()