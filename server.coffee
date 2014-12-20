'use strict'

global.config = require('environmental-configuration')('./config')
express = require 'express'

app = express()

# Configure express
require('./config/express')(app)

# Configure API Routing
require('./api/routes')(app)

# Configure application
require('./config/angular')(app)

port = process.env.PORT || config.port

app.listen port
console.log  "Server listening on port #{port}"

module.exports = app