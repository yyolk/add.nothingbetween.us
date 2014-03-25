module.exports = (app) ->
  # Helpers
  app.helpers = require "#{__dirname}/../app/helpers"

  # Lib
  app.helpers.autoload "#{__dirname}/../lib", app

  # Controllers
  app.helpers.autoload "#{__dirname}/../app/controllers", app

  # nano = require('nano')('http://192.241.178.102:5984')
  nano = require('nano')('http://localhost:5984')
  # db_name = 'nnothing'
  db_name = 'nothingbetweenus'
  app.db = nano.use(db_name)