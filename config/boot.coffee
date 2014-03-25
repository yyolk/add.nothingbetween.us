module.exports = (app) ->
  # Helpers
  app.helpers = require "#{__dirname}/../app/helpers"

  # Lib
  app.helpers.autoload "#{__dirname}/../lib", app

  # Controllers
  app.helpers.autoload "#{__dirname}/../app/controllers", app

  nano = require('nano')('http://localhost:5984')
  db_name = 'nnothing'
  app.db = nano.use(db_name)