#! /usr/local/bin/coffee
express     = require 'express'
app         = express()

nodemon     = require 'nodemon'

path        = require 'path'

nodemon
    script: 'compile.sh'
    exec: 'zsh'
    ext: 'coffee styl jade sh'

app.use express.static path.join __dirname, 'public'

app.listen 3000, ->
    console.log "~~~~~> Listening on 3000"
