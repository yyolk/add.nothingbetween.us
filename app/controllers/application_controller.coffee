module.exports = (app) ->
  class app.ApplicationController

    # GET /
    @index = (req, res) ->
      res.render 'index',
        view: 'index'

    @make = (req, res) ->
      app.db.insert({
        created_at: new Date()
        style: "background-color:floralwhite;border:6px ridge seagreen;"
        message: 'a new message'
        }, () ->
          res.render 'index'
        )