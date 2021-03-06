module.exports = (app) ->
  # Index
  app.get '/', app.ApplicationController.index
  app.get '/make', app.ApplicationController.make
  app.post '/submit', app.ApplicationController.submit
  app.post '/image', app.ApplicationController.image
  app.get '/show/:id', app.ApplicationController.show

  # Error handling (No previous route found. Assuming it’s a 404)
  app.get '/*', (req, res) ->
    NotFound res

  NotFound = (res) ->
    res.render '404', status: 404, view: 'four-o-four'
