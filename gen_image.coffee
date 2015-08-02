# for each file in dir,
# generate structure
#
#  .col-sm-3.col-xs-6
#    img(src=#{src})
#
# dir structure is img/work/<category>/<imgname>.jpg
#
#
fs = require "fs"
path = require "path"

wrap = (filename) ->
    buff = ""

    buff += ".col-sm-3.col-xs-6\n"
    buff += "  img(src=\"" + filename + "\")\n\n"

    return buff

storeDir = "dist/public/img/work"

servePrefix = "/img/work"

dirs = [
    "short"
    "medium"
    "long"
    "male"
    "formal"
]

buff = ""
buffset = []
dirs.forEach (dir, index, arr) ->

    dirPath = path.join storeDir, dir

    fs.readdir dirPath, (err, files) ->
        throw err if err

        buff = "h2 " + dir + "\n"

        files.forEach (file, _i, _a) ->
            srcPath = path.join servePrefix, dir,  file
            buff += wrap srcPath

        console.log buff
        buffset.push buff

        if buffset.length is dirs.length
            fs.writeFileSync "gallery_imgs.jade", buffset.join("")

