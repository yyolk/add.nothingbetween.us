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
        }, (err, body) ->
          res.render 'index'
        )

    @show = (req, res) ->
      # app.db.get(req.params.name, (err, body) ->
      #   res.send(body)
      # )
      # app.db.show('nothingbetweenus', 'produceconsume', req.params.id, (err, doc) ->
        app.db.get(req.params.id, {}, (err, body)->

          if(!err)
            # res.send(doc)
            res.render('show', {
              doc: body
              })
        )


    @image = (req, res) ->
      app.db.insert(req.body, req.body._id, (err, doc)->
        if(!err)
          # res.render('img', {img: req.body.img});
          # res.redirect('http://nothingbetween.us/p/'+req.body._id)
          # res.redirect('http://nothingbetween.us/img/'+req.body._id)
          res.redirect 'http://produceconsume.net/project/nothingbetween.us/'+req.body._id
      );
    @submit = (req, res) ->
      # res.send(req.body)
      app.db.insert({
        created_at: new Date()
        style: req.body.style
        message: req.body.message
        }, (err, body) ->
          # res.send(body)
          # app.db.show('nothingbetweenus', 'post', body.id, (err, doc) ->
          #   res.send(doc)
          # )
          res.redirect('/show/'+body.id)
        )