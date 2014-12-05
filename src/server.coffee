#! /usr/local/bin/coffee
express     = require 'express'
app         = express()

path        = require 'path'

app.use express.static path.join __dirname, '../public'

PORT = process.env.PORT || 3000

sendFileOptions =
    root: path.join __dirname, "../public"

app.get "/", (req, res) ->
    res.sendFile "index.html", sendFileOptions

app.get "/design-team", (req, res) ->
    res.sendFile "design_team.html", sendFileOptions

app.get "/our-work", (req, res) ->
    res.sendFile "gallery.html", sendFileOptions

app.get "/our-services", (req, res) ->
    res.sendFile "services.html", sendFileOptions

app.get "/contact", (req, res) ->
    res.sendFile "contact.html", sendFileOptions

app.listen PORT, ->
    console.log "~~~~~> Listening on " + PORT
